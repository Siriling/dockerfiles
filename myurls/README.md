# myurls

GitHub：[stilleshan/dockerfiles](https://github.com/stilleshan/dockerfiles)
Docker：[stilleshan/myurls](https://hub.docker.com/r/stilleshan/myurls)

> *docker image support for X86 and ARM*

## 简介
基于 [CareyWang/MyUrls](https://github.com/CareyWang/MyUrls) 短链接程序的修改版容器镜像,主要解决方便的自定义前端域名以及 ARM64 架构的支持.

## 示例
[https://url.siriling.com:81](https://url.siriling.com:81)

## 部署

**由于需要搭配`redis`使用，建议使用`docker compose`部署**

### docker

默认Redis无密码

```shell
docker run -d \
  --name myurls \
  --restart=unless-stopped \
  --net='bridge' \
  -p 8002:8002 \
  -e MYURLS_DOMAIN="url.siriling.com:81" \
  -e MYURLS_TTL="90" \
  -e MYURLS_REDIS="10.10.10.254:6379" \
  siriling/myurls:latest \
```

### docker compose
- 下载 [docker-compose.yml](https://raw.githubusercontent.com/stilleshan/dockerfiles/main/myurls/docker-compose.yml)
- 修改`MYURLS_DOMAIN`为你的域名
- 修改`MYURLS_TTL`为短链接有效期(单位:天)
```shell
docker-compose up -d
```

### Nginx 反代
需要搭配 Nginx 反向代理配置 HTTPS 证书使用,参考`domain.conf`配置文件,注意需要修改`域名`,`证书路径`,`日志路径`

sub-web访问出现跨域问题

在Nginx里修改

```shell
location /{
 #...
 add_header Access-Control-Allow-Origin *;
 #...
}
```

## 参考
- [CareyWang/MyUrls](https://github.com/CareyWang/MyUrls)
