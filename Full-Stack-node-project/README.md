.# Full Stack Node.js Project

A production-ready full-stack DevOps project featuring a Node.js Express backend, containerized with Docker, orchestrated with Kubernetes, and monitored with Prometheus and Grafana.

## 📋 Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Backend Setup](#backend-setup)
- [Docker](#docker)
- [Kubernetes Deployment](#kubernetes-deployment)
- [Monitoring](#monitoring)
- [API Endpoints](#api-endpoints)
- [Quick Start](#quick-start)

## 🎯 Overview

This project demonstrates a complete DevOps workflow with:
- **Backend**: Express.js application running on Node.js
- **Containerization**: Docker with multi-stage builds for optimized images
- **Orchestration**: Kubernetes deployment with load balancing
- **Monitoring**: Prometheus metrics collection and Grafana visualization

## 📁 Project Structure

```
.
├── backend/                    # Node.js Express application
│   ├── package.json           # Project dependencies
│   ├── server.js              # Express server
│   └── Dockerfile             # Multi-stage Docker build
├── K8S/                        # Kubernetes configurations
│   ├── deployment.yaml        # Kubernetes deployment (2 replicas)
│   └── service.yaml           # NodePort service
└── monitoring/                 # Monitoring stack
    ├── prometheus-configmap.yaml
    ├── prometheus-deployment.yaml
    ├── prometheus-service.yaml
    ├── grafana-deployment.yaml
    └── grafana-service.yaml
```

## 📦 Prerequisites

- **Node.js** v20+ (for local development)
- **Docker** (for containerization)
- **Kubernetes cluster** (for orchestration) or **kubectl** configured
- **npm** or **yarn** (Node.js package manager)

## 🚀 Backend Setup

### Local Development

1. Navigate to the backend directory:
```bash
cd backend
```

2. Install dependencies:
```bash
npm install
```

3. Start the server:
```bash
npm start
# or
node server.js
```

The server will run on `http://localhost:3000`

### Dependencies

- **express** ^5.2.1 - Web framework for Node.js

## 🐳 Docker

### Building the Docker Image

The project uses a multi-stage Docker build for optimized image size:

```bash
cd backend
docker build -t fullstack-node-project:backend-node .
```

### Running with Docker

```bash
docker run -p 3000:3000 fullstack-node-project:backend-node
```

### Docker Image Registry

The image is published to Docker Hub:
- **Repository**: `amrelhady388/fullstack-node-project:backend-node`

## ☸️ Kubernetes Deployment

### Prerequisites

- Running Kubernetes cluster (local or cloud-based)
- `kubectl` CLI configured

### Deployment Configuration

The Kubernetes deployment includes:
- **2 replicas** for high availability
- **NodePort service** exposing port `30001`
- **Container port** 3000

### Deploying to Kubernetes

1. Apply the deployment:
```bash
kubectl apply -f K8S/deployment.yaml
```

2. Apply the service:
```bash
kubectl apply -f K8S/service.yaml
```

### Verify Deployment

```bash
# Check deployment status
kubectl get deployments

# Check running pods
kubectl get pods

# Check services
kubectl get services

# View deployment details
kubectl describe deployment backend-deployment

# Check logs
kubectl logs -l app=backend
```

### Access the Application

- **Internal access**: `backend-service:3000`
- **External access**: `http://<node-ip>:30001`

## 📊 Monitoring

### Prometheus

Prometheus is configured to collect metrics from the application and Kubernetes cluster.

**Service Details**:
- Deployment with persistent storage
- ConfigMap for scrape configurations
- Service for metric collection

### Grafana

Grafana is set up for visualization and dashboards.

**Service Details**:
- Grafana deployment
- Pre-configured data sources
- Service for access

### Deploying Monitoring Stack

```bash
# Apply Prometheus ConfigMap
kubectl apply -f monitoring/prometheus-configmap.yaml

# Deploy Prometheus
kubectl apply -f monitoring/prometheus-deployment.yaml
kubectl apply -f monitoring/prometheus-service.yaml

# Deploy Grafana
kubectl apply -f monitoring/grafana-deployment.yaml
kubectl apply -f monitoring/grafana-service.yaml
```

### Accessing Monitoring Dashboards

After deployment, retrieve service endpoints:

```bash
kubectl get services -n default
```

## 📡 API Endpoints

### Root Endpoint
```
GET /
```
**Response**:
```json
{
  "message": "DevOps Project is Running 🚀",
  "status": "OK"
}
```

### Health Check
```
GET /health
```
**Response**:
```json
{
  "status": "healthy"
}
```

## ⚡ Quick Start

### Option 1: Local Development
```bash
cd backend
npm install
npm start
```

### Option 2: Docker
```bash
cd backend
docker build -t fullstack-node-project .
docker run -p 3000:3000 fullstack-node-project
```

### Option 3: Kubernetes
```bash
kubectl apply -f K8S/deployment.yaml
kubectl apply -f K8S/service.yaml
kubectl get services
```

## 🔍 Health Checks

The application exposes health check endpoints for:
- Kubernetes liveness probes
- Readiness probes
- Monitoring systems

## 📝 Notes

- The application runs on **port 3000** by default
- The Kubernetes service exposes the application on **port 30001** (NodePort)
- Multi-stage Docker builds ensure optimized image sizes
- The deployment includes 2 replicas for high availability

## 📄 License

ISC

---

**Author**: DevOps Team
**Last Updated**: 2026
