# Three-Tier Go Application

A simple three-tier web application demonstrating a blog system with a Go backend, MySQL database, and Nginx reverse proxy. The application serves blog post titles from a database via a REST API.

## Architecture

The application consists of three main components:

- **Nginx**: Acts as a reverse proxy with SSL termination, forwarding requests to the backend service
- **Backend (Go)**: REST API server that queries the MySQL database for blog post titles
- **Database (MySQL)**: Stores blog post data in a simple table structure

## Features

- RESTful API endpoint to retrieve blog post titles
- SSL/TLS encryption via Nginx
- Containerized deployment using Docker
- Kubernetes deployment manifests included
- Automatic database initialization with sample data

## Prerequisites

- Docker and Docker Compose
- (For Kubernetes deployment) kubectl and a Kubernetes cluster

## Quick Start with Docker Compose

1. Clone this repository and navigate to the project directory:
   ```bash
   cd Three-Tier-GoApp-project
   ```

2. Build and start the services:
   ```bash
   docker-compose up --build
   ```

3. The application will be available at:
   - HTTP: http://localhost:8080 (redirects to HTTPS)
   - HTTPS: https://localhost:8443

## API Endpoints

- `GET /`: Returns a JSON array of blog post titles

Example response:
```json
[
  "Blog post #0",
  "Blog post #1",
  "Blog post #2",
  "Blog post #3",
  "Blog post #4"
]
```

## Project Structure

```
Three-Tier-GoApp-project/
├── docker-compose.yml          # Docker Compose configuration
├── backend/                    # Go backend application
│   ├── Dockerfile             # Backend container configuration
│   ├── main.go               # Go application code
│   ├── go.mod                # Go module dependencies
│   └── db-password           # Database password file
├── database/                  # Database configuration
│   └── env                   # MySQL environment variables
├── nginx/                     # Nginx reverse proxy
│   ├── Dockerfile            # Nginx container configuration
│   ├── nginx.conf            # Nginx configuration
│   └── generate-ssl.sh       # SSL certificate generation script
└── K8S/                      # Kubernetes deployment manifests
    ├── backend-deployment.yaml
    ├── backend-service.yaml
    ├── backend-secret.yaml
    ├── db-deployment.yaml
    ├── db-service.yaml
    ├── db-secret.yaml
    ├── db-pv.yaml
    ├── db-pvc.yaml
    ├── nginx-deployment.yaml
    └── nginx-service.yaml
```

## Kubernetes Deployment

To deploy the application to a Kubernetes cluster:

1. Apply the Kubernetes manifests:
   ```bash
   kubectl apply -f K8S/
   ```

2. The application will be exposed via the nginx service. Check the service details:
   ```bash
   kubectl get services
   ```

## Development

### Backend

The Go backend uses the following dependencies:
- gorilla/mux: HTTP router
- gorilla/handlers: HTTP middleware
- go-sql-driver/mysql: MySQL driver

### Database

The application creates a `blog` table with the following schema:
```sql
CREATE TABLE blog (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255),
    PRIMARY KEY (id)
);
```

### SSL Certificates

SSL certificates are generated automatically during the Nginx container build process using the `generate-ssl.sh` script.

## Environment Variables

### Database
- `MYSQL_ROOT_PASSWORD`: Root password for MySQL (set in `database/env`)
- `MYSQL_DATABASE`: Database name (default: example)

### Backend
- Database connection uses Docker secrets mounted at `/run/secrets/db-password`

## Ports

- Nginx: 8080 (HTTP), 8443 (HTTPS)
- Backend: 8000 (internal)
- MySQL: 3306 (internal)

## Troubleshooting

- Ensure Docker and Docker Compose are installed and running
- Check container logs: `docker-compose logs`
- Verify network connectivity between containers
- For Kubernetes: Check pod status with `kubectl get pods`

## License

This project is for educational purposes.