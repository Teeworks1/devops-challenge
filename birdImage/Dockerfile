FROM golang:1.22.5-alpine AS builder

WORKDIR /app

COPY go.mod  ./
RUN go mod download

# Copy the rest of the application source code
COPY . .

RUN go build -o api .

FROM alpine:3.18

WORKDIR /app

COPY --from=builder /app/api /app/api

EXPOSE 8080

CMD ["./api"]
