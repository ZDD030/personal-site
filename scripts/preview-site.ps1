param(
  [ValidateRange(1, 65535)][int]$Port = 4322,
  [string]$Page = '/',
  [ValidateRange(30, 600)][int]$StartupTimeoutSeconds = 180,
  [switch]$NoOpen
)

$ErrorActionPreference = 'Stop'
$siteRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
$siteUrl = "http://127.0.0.1:$Port"
if (-not $Page.StartsWith('/') -or $Page.StartsWith('//')) {
  throw 'Page 必须是以单个 / 开头的本站路径。'
}
$pageUrl = "$siteUrl$Page"
$previousBackground = $env:ASTRO_DEV_BACKGROUND
$previousTelemetry = $env:ASTRO_TELEMETRY_DISABLED
Push-Location -LiteralPath $siteRoot
try {
  $env:ASTRO_DEV_BACKGROUND = '1'
  $env:ASTRO_TELEMETRY_DISABLED = '1'

  # Astro 每个项目只管理一个开发服务，切换端口时先停止旧服务。
  $siteLockPath = Join-Path $siteRoot '.astro/dev.json'
  if (Test-Path -LiteralPath $siteLockPath) {
    $siteLock = Get-Content -LiteralPath $siteLockPath -Raw | ConvertFrom-Json
    if ($siteLock.port -ne $Port) {
      & pnpm.cmd dev stop
      if ($LASTEXITCODE -ne 0) { throw '停止旧预览服务失败。' }
    }
  }

  # Astro --background 固定在 30 秒后终止服务，Windows 冷启动可能超过一分钟。
  # 直接在隐藏进程中运行，继续使用 Astro 的服务锁与 stop/status 命令。
  $siteAstroBin = Join-Path $siteRoot 'node_modules/astro/bin/astro.mjs'
  if (-not (Test-Path -LiteralPath $siteAstroBin)) {
    throw '未找到 Astro，请先在项目目录运行 pnpm install。'
  }
  $siteStartingPath = Join-Path $siteRoot '.astro/dev-starting.json'
  $siteServer = $null
  if (Test-Path -LiteralPath $siteLockPath) {
    $siteLock = Get-Content -LiteralPath $siteLockPath -Raw | ConvertFrom-Json
    $siteServer = Get-Process -Id $siteLock.pid -ErrorAction SilentlyContinue
  }
  if (-not $siteServer -and (Test-Path -LiteralPath $siteStartingPath)) {
    $siteStarting = Get-Content -LiteralPath $siteStartingPath -Raw | ConvertFrom-Json
    $sitePendingProcess = Get-CimInstance Win32_Process -Filter "ProcessId = $($siteStarting.pid)"
    if ($sitePendingProcess -and $sitePendingProcess.CommandLine.Contains($siteAstroBin)) {
      if ($siteStarting.port -ne $Port) { throw '网站仍在其他端口启动，请等待完成后再切换。' }
      $siteServer = Get-Process -Id $siteStarting.pid -ErrorAction SilentlyContinue
    }
  }
  if (-not $siteServer) {
    $siteAstroDir = Join-Path $siteRoot '.astro'
    New-Item -ItemType Directory -Path $siteAstroDir -Force | Out-Null
    $siteNode = (Get-Command node.exe -ErrorAction Stop).Source
    $siteServer = Start-Process -FilePath $siteNode `
      -ArgumentList @(('"' + $siteAstroBin + '"'), 'dev', '--host', '127.0.0.1', '--port', "$Port") `
      -WorkingDirectory $siteRoot -WindowStyle Hidden `
      -RedirectStandardOutput (Join-Path $siteAstroDir 'dev.log') `
      -RedirectStandardError (Join-Path $siteAstroDir 'dev-error.log') -PassThru
    @{ pid = $siteServer.Id; port = $Port } | ConvertTo-Json | Set-Content -LiteralPath $siteStartingPath -Encoding UTF8
    Write-Host "网站正在启动（PID $($siteServer.Id)），首次启动最多等待 $StartupTimeoutSeconds 秒……"
  } else {
    Write-Host "复用网站服务（PID $($siteServer.Id)）……"
  }

  # 页面首次访问也需要编译，实际返回正文之后再打开浏览器。
  $siteDeadline = (Get-Date).AddSeconds($StartupTimeoutSeconds)
  $siteReady = $false
  do {
    $siteServer.Refresh()
    if ($siteServer.HasExited) {
      Get-Content -LiteralPath (Join-Path $siteRoot '.astro/dev-error.log') -Tail 30 -ErrorAction SilentlyContinue | Write-Host
      throw '网站启动进程已退出，请检查上方错误。'
    }
    try {
      $siteResponse = Invoke-WebRequest -Uri $pageUrl -UseBasicParsing -TimeoutSec 5
      $siteReady = $siteResponse.StatusCode -eq 200 -and $siteResponse.Content.Contains('id="swup-container"')
    } catch {
      $siteReady = $false
    }
    if (-not $siteReady) { Start-Sleep -Seconds 1 }
  } while (-not $siteReady -and (Get-Date) -lt $siteDeadline)
  if (-not $siteReady) { throw "页面尚未就绪：$pageUrl。服务仍在启动，可重新运行本脚本；日志见 .astro/dev.log 和 .astro/dev-error.log。" }
  if (Test-Path -LiteralPath $siteStartingPath) { Remove-Item -LiteralPath $siteStartingPath -ErrorAction SilentlyContinue }

  Write-Host "网站已就绪：$pageUrl"
  if (-not $NoOpen) {
    $siteEdgePaths = @(
      "${env:ProgramFiles(x86)}/Microsoft/Edge/Application/msedge.exe",
      "$env:ProgramFiles/Microsoft/Edge/Application/msedge.exe",
      "$env:LOCALAPPDATA/Microsoft/Edge/Application/msedge.exe"
    )
    $siteEdge = $siteEdgePaths | Where-Object { Test-Path -LiteralPath $_ } | Select-Object -First 1
    if (-not $siteEdge) { throw '未找到 Microsoft Edge，请手动在 Edge 打开上方地址。' }
    Start-Process -FilePath $siteEdge -ArgumentList $pageUrl
  }
} finally {
  $env:ASTRO_DEV_BACKGROUND = $previousBackground
  $env:ASTRO_TELEMETRY_DISABLED = $previousTelemetry
  Pop-Location
}
