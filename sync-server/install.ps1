$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) { throw '请先安装 Docker 和 Docker Compose。' }
if (-not (Test-Path -LiteralPath '.env')) {
    $taskBytes = New-Object byte[] 48
    $taskRng = [System.Security.Cryptography.RandomNumberGenerator]::Create()
    $taskRng.GetBytes($taskBytes)
    $taskRng.Dispose()
    $taskSecret = [Convert]::ToBase64String($taskBytes)
    $taskTemplate = Get-Content -LiteralPath '.env.example' -Raw
    $taskTemplate = $taskTemplate -replace '(?m)^TOKEN_SECRET=.*$', "TOKEN_SECRET=$taskSecret"
    [System.IO.File]::WriteAllText((Join-Path $PSScriptRoot '.env'), $taskTemplate, (New-Object System.Text.UTF8Encoding($false)))
    Write-Host '已生成 .env；新注册需配置 SMTP。请保留密钥并备份此文件。'
}
docker compose up -d --build
if ($LASTEXITCODE -ne 0) { throw 'Docker Compose 启动失败。' }
Write-Host '部署完成，请访问 http://主机地址:配置端口/health；升级保留原 .env 与 data。'
