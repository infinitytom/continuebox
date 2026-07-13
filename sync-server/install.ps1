$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
  Write-Host '未找到 Docker。请先在飞牛 Docker 应用中安装 Docker，然后重新运行此脚本。' -ForegroundColor Yellow
  exit 1
}
if (-not (Test-Path '.env')) {
  $secret = [Convert]::ToBase64String((1..48 | ForEach-Object { Get-Random -Maximum 256 }))
  @("PORT=8080", "TOKEN_SECRET=$secret", "TOKEN_DAYS=30", "ALLOW_REGISTER=true") | Set-Content -Encoding utf8 '.env'
  Write-Host '已生成 .env 配置文件。'
}
docker compose up -d --build
$port = (Get-Content .env | Where-Object { $_ -like 'PORT=*' }) -replace '^PORT=', ''
Write-Host "部署完成：http://本机或NAS的Tailscale地址:$port/docs" -ForegroundColor Green

