FROM java:8
LABEL maintainer="Siriling <Siriling@siriling.com>"

WORKDIR /app
COPY start.sh ./
RUN chmod a+x /app/start.sh

ADD blog-server.jar demo.jar
EXPOSE 8080
CMD [ "sh", "-c", "/app/start.sh" ]