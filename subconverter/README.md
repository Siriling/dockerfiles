# SubConverter整合

# 目录

[一、简介](#一简介)

[二、展示](#二展示)

[三、使用](三使用)

[四、Nginx反向代理配置](#四nginx反向代理配置)

[五、仓库地址](#五仓库信息)

# 一、简介

基于Sub-web和Subconverter前后端整合容器，支持自定义配置

# 二、展示

[https://sub.siriling.com:81](https://sub.siriling.com:81)

# 三、使用

**由于需要搭配Redis使用，建议使用docker compose部署**

## docker

- 修改挂载路径，根据需求自行修改`conf/config.js`中的相关配置
- subconverter同样支持挂载外部配置文件，参考容器内部路径:`/base/snippets/rulesets.txt`

```shell
docker run -d \
  --name subconverter \
  --restart=unless-stopped \
  --net='bridge' \
  -p 80:80 \
  -v /root/appdata/subconverter/conf:/usr/share/nginx/html/conf \
  siriling/subconverter:latest
```

## docker compose

- 文件下载：[docker-compose.yml](https://raw.githubusercontent.com/Siriling/dockerfiles/main/myurls/docker-compose.yml)

```shell
docker-compose up -d
```

## build docker image

```shell
docker build -t siriling/subconverter:latest .
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

- GitHub：[Siriling/dockerfiles](https://github.com/Siriling/dockerfiles/tree/main/subconverter)
- Docker：[siriling/subconverter](https://github.com/siriling/subconverter)
