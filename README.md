# URL Shortener Service

A simple URL shortener service built with FastAPI, Redis, and Docker.

## Features

- Create short URLs from long URLs
- Redirect from short URLs to original URLs
- Persistent storage using Redis
- Containerized with Docker

## Prerequisites

- Docker
- Docker Compose

## Running the Application

1. Build and start the containers:
```bash
docker-compose up --build
```

2. The application will be available at `http://localhost:8000`

## API Endpoints

- `GET /`: Welcome message
- `POST /shorten`: Create a short URL
  - Request body: `{"long_url": "https://example.com"}`
  - Response: `{"short_url": "/abc123"}`
- `GET /{short_code}`: Redirect to the original URL

## Example Usage

1. Create a short URL:
```bash
curl -X POST "http://localhost:8000/shorten" -H "Content-Type: application/json" -d '{"long_url": "https://example.com"}'
```

2. Use the returned short URL in your browser or with curl:
```bash
curl -L "http://localhost:8000/abc123"
```

## Development

The application is built with:
- FastAPI (Python web framework)
- Redis (In-memory data store)
- Docker (Containerization)
- Docker Compose (Service orchestration) 