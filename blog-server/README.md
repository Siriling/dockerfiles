

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
  --name blog-server \
  --restart=unless-stopped \
  --net='bridge' \
  -p '8081:8080/tcp' \
  -v '/mnt/user/appdata/blog-server/auth_key':'/auth_key' \
  siriling/blog-server:latest
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
