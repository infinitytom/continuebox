#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"
command -v docker >/dev/null 2>&1 || { echo '请先安装 Docker 和 Docker Compose。'; exit 1; }
if [ ! -f .env ]; then
  umask 077
  cp .env.example .env
  secret=$(od -An -N48 -tx1 /dev/urandom | tr -d ' \n')
  sed "s/^TOKEN_SECRET=.*/TOKEN_SECRET=$secret/" .env > .env.tmp
  mv .env.tmp .env
  echo '已生成 .env；新注册需配置 SMTP。请保留密钥并备份此文件。'
fi
docker compose up -d --build
echo '部署完成，请访问 http://主机地址:配置端口/health；升级保留原 .env 与 data。'
