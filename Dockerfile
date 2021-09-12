FROM golang:alpine3.14 AS build
WORKDIR /app
COPY go.mod ./
COPY *.go ./
RUN go build -o /silly-app

FROM alpine:3.13
COPY --from=build /silly-app /usr/local/bin
EXPOSE 8080
CMD ["silly-app"]
ENV VERSION=1.0.1