

# Movie Server（此项目未完成）

# 目录

[一、简介](#一简介)

[二、展示](#二展示)

[三、使用](三使用)

[四、仓库地址](#四仓库地址)

# 一、简介

基于SpringBoot的电影信息网站

# 二、展示

[https://movie-project.siriling.com:81](https://movie-project.siriling.com:81)

# 三、使用

**由于需要搭配MySQL和Redis使用，建议使用docker compose部署**

## docker


```shell
docker run -d \
  --name movie-server \
  --restart=unless-stopped \
  --net='bridge' \
  -p '8082:8080/tcp' \
  siriling/movie-server:latest
```

## docker compose

- 文件下载：[docker-compose.yml](https://raw.githubusercontent.com/Siriling/dockerfiles/main/movie-server/docker-compose.yml)

```shell
docker-compose up -d
```

## build docker image

```shell
docker build -t siriling/movie-server:latest .
```

# 四、仓库地址

- GitHub：[Siriling/dockerfiles](https://github.com/Siriling/dockerfiles/tree/main/movie-server)
- Docker：[siriling/movie-server](https://hub.docker.com/r/siriling/movie-server)
