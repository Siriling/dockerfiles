# build front-end
FROM node:lts-alpine AS frontend

RUN apk add --update git
RUN git clone https://github.com/Chanzhaoyu/chatgpt-web /chatgpt-web

# 自定义头像，名称，描述
RUN sed -i "s#https://raw.githubusercontent.com/Chanzhaoyu/chatgpt-web/main/src/assets/avatar.jpg#https://raw.githubusercontent.com/Chanzhaoyu/chatgpt-web/main/src/assets/avatar.jpg#g" /chatgpt-web/src/store/modules/user/helper.ts
RUN sed -i "s#name: 'ChenZhaoYu'#name: 'Siriling'#g" /chatgpt-web/src/store/modules/user/helper.ts
# RUN sed -i "s#Star on <a href=\"https://github.com/Chanzhaoyu/chatgpt-bot\" class=\"text-blue-500\" target=\"_blank\" >Github</a>#我的博客#g" /chatgpt-web/src/store/modules/user/helper.ts

RUN npm install pnpm -g

WORKDIR /app

RUN cp /chatgpt-web/package.json /app && cp /chatgpt-web/pnpm-lock.yaml /app && \
    pnpm install && \
    cp /chatgpt-web /app && \
    pnpm run build

# build backend
FROM node:lts-alpine as backend

RUN npm install pnpm -g

WORKDIR /app

RUN cp /chatgpt-web/service/package.json /app && cp /chatgpt-web/service/pnpm-lock.yaml /app && \
    pnpm install && \
    cp /chatgpt-web/service /app && \
    pnpm build

# service
FROM node:lts-alpine

RUN npm install pnpm -g

WORKDIR /app

RUN cp /chatgpt-web/service/package.json /app && cp/chatgpt-web/service/pnpm-lock.yaml /app && \
    pnpm install --production && rm -rf /root/.npm /root/.pnpm-store /usr/local/share/.cache /tmp/* && \
    cp /chatgpt-web/service /app

COPY --from=frontend /app/dist /app/public

COPY --from=backend /app/build /app/build

EXPOSE 3002

CMD ["pnpm", "run", "prod"]
