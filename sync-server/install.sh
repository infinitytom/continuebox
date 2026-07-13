#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"
command -v docker >/dev/null 2>&1 || { echo '未找到 Docker，请先在飞牛 Docker 应用中安装 Docker。'; exit 1; }
if [ ! -f .env ]; then
  secret=$(od -An -N48 -tx1 /dev/urandom | tr -d ' \n')
  printf 'PORT=8080\nTOKEN_SECRET=%s\nTOKEN_DAYS=30\nALLOW_REGISTER=true\n' "$secret" > .env
  echo '已生成 .env 配置文件。'
fi
docker compose up -d --build
port=$(sed -n 's/^PORT=//p' .env)
echo "部署完成：http://本机或NAS的Tailscale地址:${port}/docs"

