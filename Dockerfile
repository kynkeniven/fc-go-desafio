FROM golang:alpine3.18 AS build
WORKDIR /app
COPY . /app
RUN CGO_ENABLED=0 GOOS=linux go build -o api main.go



FROM scratch
WORKDIR /app
COPY --from=build /app/api ./
EXPOSE 8080
CMD [ "./api" ]
