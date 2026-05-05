# ---------- Stage 1: Build ----------
FROM golang:tip-alpine3.21 AS builder

WORKDIR /app

#install dependencies
COPY go.mod go.sum ./
RUN go mod download

#copy source code
COPY main.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o backend .

# ---------- Stage 2: Runtime ----------
FROM golang:tip-alpine3.21

WORKDIR /app

#copy the binary from the builder stage
COPY --from=builder /app/backend /app/backend

RUN adduser -D GoApp
RUN chown -R GoApp:GoApp /app

#expose the port
EXPOSE 8000

#run the application
CMD ["./backend"]
