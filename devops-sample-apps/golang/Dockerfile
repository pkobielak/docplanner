FROM golang:1.21-alpine AS builder

WORKDIR /src

COPY main.go .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app main.go


# Final minimal image
FROM scratch
COPY --from=builder /src/app /app

ENTRYPOINT ["/app"]
