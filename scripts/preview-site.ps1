param([int]$Port = 4321)

$ErrorActionPreference = 'Stop'
$siteRoot = Join-Path $PSScriptRoot '..'
$previousBackground = $env:ASTRO_DEV_BACKGROUND
$previousTelemetry = $env:ASTRO_TELEMETRY_DISABLED
Push-Location -LiteralPath $siteRoot
try {
  $env:ASTRO_DEV_BACKGROUND = '1'
  $env:ASTRO_TELEMETRY_DISABLED = '1'
  & pnpm.cmd dev --host 127.0.0.1 --port $Port
  if ($LASTEXITCODE -ne 0) { throw "网站启动失败，退出码 $LASTEXITCODE" }
} finally {
  $env:ASTRO_DEV_BACKGROUND = $previousBackground
  $env:ASTRO_TELEMETRY_DISABLED = $previousTelemetry
  Pop-Location
}
