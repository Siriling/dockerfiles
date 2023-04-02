# build front-end
FROM node:lts-alpine AS frontend

RUN apk add --update git
RUN git clone https://github.com/Chanzhaoyu/chatgpt-web /chatgpt-web
# 自定义头像，名称，描述
RUN sed -i "s#https://raw.githubusercontent.com/Chanzhaoyu/chatgpt-web/main/src/assets/avatar.jpg#https://blog.siriling.com:1212/wp-content/uploads/2022/12/柒.png#g" /chatgpt-web/src/store/modules/user/helper.ts
RUN sed -i "s#name: 'ChenZhaoYu'#name: 'Siriling'#g" /chatgpt-web/src/store/modules/user/helper.ts
RUN sed -i 's#Star on <a href="https://github.com/Chanzhaoyu/chatgpt-bot" class="text-blue-500" target="_blank" >Github</a>#Build on <a href="https://github.com/Siriling/dockerfiles/tree/main/chatgpt-web" class="text-blue-500" target="_blank" >Github</a>#g' /chatgpt-web/src/store/modules/user/helper.ts

RUN npm install pnpm -g
WORKDIR /app

RUN cp /chatgpt-web/package.json /app && cp /chatgpt-web/pnpm-lock.yaml /app &&\
    pnpm install && \
    cp -r /chatgpt-web/* /app && \
    pnpm run build && \
    rm -rf /chatgpt-web

# build backend
FROM node:lts-alpine as backend

RUN apk add --update git
RUN git clone https://github.com/Chanzhaoyu/chatgpt-web /chatgpt-web

RUN npm install pnpm -g
WORKDIR /app

RUN cp /chatgpt-web/service/package.json /app && cp /chatgpt-web/service/pnpm-lock.yaml /app && \
    pnpm install && \
    cp -r /chatgpt-web/service/* /app && rm -rf /chatgpt-web && \
    pnpm build && \
    rm -rf /chatgpt-web

# service
FROM node:lts-alpine

RUN apk add --update git
RUN git clone https://github.com/Chanzhaoyu/chatgpt-web /chatgpt-web

RUN npm install pnpm -g
WORKDIR /app

RUN cp /chatgpt-web/service/package.json /app && cp /chatgpt-web/service/pnpm-lock.yaml /app && \
    pnpm install --production && rm -rf /root/.npm /root/.pnpm-store /usr/local/share/.cache /tmp/* && \
    cp -r /chatgpt-web/service/* /app  && \
    rm -rf /chatgpt-web

COPY --from=frontend /app/dist /app/public
COPY --from=backend /app/build /app/build

EXPOSE 3002

CMD ["pnpm", "run", "prod"]
