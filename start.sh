#/bin/sh

sed -i "s#https://url.siriling.com:81#https://${MYURLS_DOMAIN}#g" /app/public/index.html

/app/myurls -domain ${MYURLS_DOMAIN} -conn ${MYURLS_REDIS} -ttl ${MYURLS_TTL}