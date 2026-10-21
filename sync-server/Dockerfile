# Default: official Python image; override PYTHON_IMAGE for a trusted mirror.
ARG PYTHON_IMAGE=python:3.12-slim
FROM ${PYTHON_IMAGE}
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 DATA_DIR=/data
COPY requirements.txt .
# pip 源默认走清华镜像（国内 NAS 构建快得多）。海外或走代理的机器在 .env 里设
# PIP_INDEX_URL=https://pypi.org/simple 即可覆盖，无需改本文件。
ARG PIP_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install --no-cache-dir -i "$PIP_INDEX_URL" -r requirements.txt
COPY app ./app
RUN mkdir -p /data
VOLUME ["/data"]
EXPOSE 8080
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080", "--no-access-log", "--limit-concurrency", "64"]
