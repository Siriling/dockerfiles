# SubConverter

# 目录

[一、简介](#一简介)

[二、展示](#二展示)

[三、使用](三使用)

[四、Nginx反向代理配置](#四nginx反向代理配置)

[五、仓库地址](#五仓库信息)

# 一、简介

基于[Sub-web](https://github.com/Siriling/sub-web)和[Subconverter](https://github.com/tindy2013/subconverter)前后端整合容器，支持短链接，支持自定义配置

# 二、展示

[https://sub.siriling.com:81](https://sub.siriling.com:81)

# 三、使用

**如果需要SubConverter前后端整合+短链接，请使用docker compose进行部署**

## docker

- 修改网站名称：添加`-e SITE_NAME='订阅转换'`
- 修改后端API：添加`-e API_URL='https://sub.siriling.com:81'`
- 修改短链接网站路径：根据需求自行修改`conf/config.js`中的相关配置
- subconverter挂载外部配置文件：参考容器内部路径:`/base/snippets/rulesets.txt`

```shell
docker run -d \
  --name subconverter \
  --restart=unless-stopped \
  --net='bridge' \
  -p 8080:80 \
  -p 25500:25500 \
  -v /root/appdata/subconverter/conf:/usr/share/nginx/html/conf \
  siriling/subconverter:latest
```

## docker compose

- 文件下载：[docker-compose.yml](https://raw.githubusercontent.com/Siriling/dockerfiles/main/subconverter/docker-compose.yml)

```shell
docker-compose up -d
```

## build docker image

```shell
docker build -t siriling/subconverter:latest .
```

# 四、Nginx反向代理配置

Sub-web访问短链接出现跨域问题，需要在Nginx里修改，参考[myurls.conf](https://raw.githubusercontent.com/Siriling/dockerfiles/main/subconverter/myurls.conf)

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
