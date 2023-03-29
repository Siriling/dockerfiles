

# Blog Server（此项目未完成）

# 目录

[一、简介](#一简介)

[二、展示](#二展示)

[三、使用](三使用)

[四、仓库地址](#四仓库信息)

# 一、简介

基于SpringBoot的博客园项目

# 二、展示

[https://blog-project.siriling.com:81](https://blog-project.siriling.com:81)

# 三、使用

**由于需要搭配MySQL和Redis使用，建议使用docker compose部署**

## docker


```shell
docker run -d \
  --name myurls \
  --restart=unless-stopped \
  --net='bridge' \
  -p '8002:8002/tcp' \
  -e MYURLS_DOMAIN="url.siriling.com:81" \
  -e MYURLS_TTL="90" \
  -e MYURLS_REDIS="10.10.10.254:6379" \
  -v '/root/appdata/myurls/logs':'/app/logs' \
  siriling/myurls:latest
```

## docker compose

- 文件下载：[docker-compose.yml](https://raw.githubusercontent.com/Siriling/dockerfiles/main/blog-server/docker-compose.yml)

```shell
docker-compose up -d
```

## build docker image

```shell
docker build -t siriling/blog-server:latest .
```

# 四、仓库地址

- GitHub：[Siriling/dockerfiles](https://github.com/Siriling/dockerfiles/tree/main/blog-server)
- Docker：[siriling/blog-server](https://hub.docker.com/r/siriling/blog-server)
