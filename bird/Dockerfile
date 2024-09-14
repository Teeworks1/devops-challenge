# Use the official Golang image as the base image for building the app
FROM golang:1.22.5-alpine AS builder

# Set the current working directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files first, then download the dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application source code
COPY . .

# Build the Go application binary
RUN go build -o api .

# Use a smaller base image for the runtime
FROM alpine:3.18

# Set a working directory
WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /app/api /app/api

# Expose the port the app will run on
EXPOSE 8080

# Set the command to run the API binary
CMD ["./api"]
