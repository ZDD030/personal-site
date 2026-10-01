param([int]$Port = 4321)

$ErrorActionPreference = 'Stop'
$previewRoot = Join-Path $PSScriptRoot '..\theme-previews\firefly'
if (-not (Test-Path -LiteralPath (Join-Path $previewRoot 'package.json'))) {
  throw 'Firefly 预览尚未下载，请按 docs/UI-OPTIONS.md 初始化。'
}

Push-Location -LiteralPath $previewRoot
$previousBackground = $env:ASTRO_DEV_BACKGROUND
$previousTelemetry = $env:ASTRO_TELEMETRY_DISABLED
try {
  # 让 Codex 管理启动进程，避免 Astro 自动转后台时的 30 秒就绪超时。
  $env:ASTRO_DEV_BACKGROUND = '1'
  $env:ASTRO_TELEMETRY_DISABLED = '1'
  & pnpm.cmd run dev --host 127.0.0.1 --port $Port
  if ($LASTEXITCODE -ne 0) { throw "Firefly 启动失败，退出码 $LASTEXITCODE" }
} finally {
  $env:ASTRO_DEV_BACKGROUND = $previousBackground
  $env:ASTRO_TELEMETRY_DISABLED = $previousTelemetry
  Pop-Location
}
