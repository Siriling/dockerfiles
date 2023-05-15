

# ChatGPT

# 目录

[一、简介](#一简介)

[二、展示](#二展示)

[三、使用](三使用)

[四、仓库地址](#四仓库地址)

# 一、简介

基于[Chanzhaoyu/chatgpt-web](https://github.com/Chanzhaoyu/chatgpt-web)ChatGPT网页版的个性化版容器镜像

# 二、展示

暂无

# 二、使用

**由于需要搭配Nginx使用，建议使用docker compose部署**

## docker


```shell
docker run \
  --name chatgpt-web \
  --restart=unless-stopped \
  --net='bridge' \
  -p '3002:3002/tcp' \
  -e OPENAI_API_KEY="you-api-key" \
  -d siriling/chatgpt-web:latest
```

## docker compose

- 文件下载：[docker-compose.yml](https://raw.githubusercontent.com/Siriling/dockerfiles/main/chatgpt-web/docker-compose.yml)

```shell
docker-compose up -d
```

## build docker image

```shell
docker build -t siriling/chatgpt-web:latest .
```

# 四、仓库地址

- GitHub：[Siriling/dockerfiles](https://github.com/Siriling/dockerfiles/tree/main/chatgpt-web)
- Docker：[siriling/chatgpt-web](https://hub.docker.com/r/siriling/chatgpt-web)
