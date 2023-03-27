FROM golang:1.19-alpine AS dependencies
RUN git clone https://github.com/CareyWang/MyUrls /app
WORKDIR /app
RUN go env -w GO111MODULE="on" && go env -w GOPROXY="https://goproxy.cn,direct"

COPY go.sum go.mod main.go ./
RUN go mod tidy 

FROM dependencies as build
WORKDIR /app
COPY main.go ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o myurls main.go 

FROM alpine:latest
WORKDIR /app
COPY --from=build /app/myurls ./
COPY public/* ./public/
COPY start.sh ./

EXPOSE 8002
CMD [ "sh", "-c", "/app/start.sh" ]
