

# Myurls

# 目录

[一、简介](#一简介)

[二、展示](#二展示)

[三、使用](三使用)

[四、Nginx反向代理配置](#四nginx反向代理配置)

[五、仓库地址](#五仓库信息)

# 一、简介

基于[CareyWang/MyUrls](https://github.com/CareyWang/MyUrls)短链接程序的修改版容器镜像，主要解决方便的自定义前端域名，自定义Redis信息以及ARM64架构的支持

# 二、展示

[https://url.siriling.com:81](https://url.siriling.com:81)

# 三、使用

**由于需要搭配Redis使用，建议使用docker compose部署**

## docker

- 默认Redis无密码


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

- 文件下载：[docker-compose.yml](https://raw.githubusercontent.com/Siriling/dockerfiles/main/myurls/docker-compose.yml)
- 修改`MYURLS_DOMAIN`为你的域名
- 修改`MYURLS_TTL`为短链接有效期（单位：天）
- 修改`MYURLS_REDIS`为自己Redis链接（`IP:端口`）

```shell
docker-compose up -d
```

## build docker image

```shell
docker build -t siriling/myurls:latest .
```

# 四、Nginx反向代理配置

Sub-web访问出现跨域问题，需要在Nginx里修改，参考[domain.conf](https://raw.githubusercontent.com/Siriling/dockerfiles/main/myurls/domain.conf)

```shell
location /{
 #...
 add_header Access-Control-Allow-Origin *;
 #...
}
```

# 五、仓库地址

- GitHub：[Siriling/dockerfiles](https://github.com/Siriling/dockerfiles/tree/main/myurls)
- Docker：[siriling/myurls](https://hub.docker.com/r/siriling/myurls)
