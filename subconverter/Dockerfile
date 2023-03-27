FROM node:14-alpine AS build
LABEL maintainer="Siriling <Siriling@siriling.com>"

ENV SUBCONVERTER_VERSION=v0.7.2
WORKDIR /
RUN apk add --no-cache bash git curl zip
RUN if [ "$(uname -m)" = "x86_64" ]; then export PLATFORM=linux64 ; else if [ "$(uname -m)" = "aarch64" ]; then export PLATFORM=aarch64 ; fi fi \
  && wget https://github.com/tindy2013/subconverter/releases/download/${SUBCONVERTER_VERSION}/subconverter_${PLATFORM}.tar.gz \
  && tar xzf subconverter_${PLATFORM}.tar.gz
RUN git clone https://github.com/Siriling/sub-web app
# RUN cd /app && npm install && npm run build
RUN sed -i "s#customBackend: defaultBackend#customBackend: 'http://127.0.0.1:25500/sub?'#g" /app/src/views/Subconverter.vue
RUN cd /app && yarn install && yarn build

FROM nginx:1.16-alpine
COPY --from=build /app/dist /usr/share/nginx/html
COPY --from=build /subconverter /base
COPY . /app
RUN chmod a+x /app/start.sh

EXPOSE 80
CMD [ "sh", "-c", "/app/start.sh" ]
