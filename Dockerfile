FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o todo-api main.go

FROM alpine:3.18
WORKDIR /app
COPY --from=builder /app/todo-api .
EXPOSE 8080
HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=3 CMD wget --no-verbose --tries=1 --spider http://localhost:8080/health || exit 1
CMD ["./todo-api"]
