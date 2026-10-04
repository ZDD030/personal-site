param(
  [ValidateRange(1, 65535)][int]$Port = 4322,
  [string]$Page = '/',
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

  # 显式启用后台模式，关闭终端后继续运行；重复启动复用已有实例。
  & pnpm.cmd dev --background --host 127.0.0.1 --port $Port
  if ($LASTEXITCODE -ne 0) { throw "网站启动失败，退出码 $LASTEXITCODE" }

  # 页面首次访问也需要编译，实际返回正文之后再打开浏览器。
  $siteDeadline = (Get-Date).AddSeconds(60)
  $siteReady = $false
  do {
    try {
      $siteResponse = Invoke-WebRequest -Uri $pageUrl -UseBasicParsing -TimeoutSec 5
      $siteReady = $siteResponse.StatusCode -eq 200 -and $siteResponse.Content.Contains('id="swup-container"')
    } catch {
      $siteReady = $false
    }
    if (-not $siteReady) { Start-Sleep -Seconds 1 }
  } while (-not $siteReady -and (Get-Date) -lt $siteDeadline)
  if (-not $siteReady) { throw "页面尚未就绪：$pageUrl。请运行 pnpm.cmd dev logs 查看原因。" }

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
