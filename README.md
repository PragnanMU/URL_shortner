# URL Shortener Service

A modern, user-friendly URL shortener service built with FastAPI, Redis, and Docker. Features a beautiful, responsive web interface for easy URL shortening.

## Features

- Create short URLs from long URLs
- Redirect from short URLs to original URLs
- Persistent storage using Redis
- Containerized with Docker
- Modern, responsive web interface
- Copy-to-clipboard functionality
- Error handling and validation
- Mobile-friendly design

## Prerequisites

- Docker
- Docker Compose

## Running the Application

1. Clone the repository:
```bash
git clone <repository-url>
cd url-short
```

2. Build and start the containers:
```bash
docker-compose up --build
```

3. The application will be available at `http://localhost:8000`

## Using the Web Interface

1. Open your browser and navigate to `http://localhost:8000`
2. Enter a long URL in the input field
3. Click "Shorten" or press Enter
4. Your shortened URL will appear below
5. Click "Copy" to copy the shortened URL to your clipboard

### Features of the Web Interface

- **Input Validation**: Automatically adds 'https://' if no protocol is specified
- **Copy to Clipboard**: One-click copying of shortened URLs
- **Error Handling**: Clear error messages for invalid inputs or server issues
- **Responsive Design**: Works perfectly on both desktop and mobile devices
- **Keyboard Support**: Press Enter to shorten URLs
- **Visual Feedback**: Success/error states and copy confirmation

## API Endpoints

The service also provides a REST API for programmatic access:

- `GET /`: Serve the web interface
- `POST /shorten`: Create a short URL
  ```bash
  curl -X POST "http://localhost:8000/shorten" \
       -H "Content-Type: application/json" \
       -d '{"long_url": "https://example.com"}'
  ```
  Response: `{"short_url": "/abc123"}`
- `GET /{short_code}`: Redirect to the original URL
  ```bash
  curl -L "http://localhost:8000/abc123"
  ```

## Development

The application is built with:
- FastAPI (Python web framework)
- Redis (In-memory data store)
- Docker (Containerization)
- Docker Compose (Service orchestration)
- HTML5/CSS3 (Modern web interface)
- JavaScript (Frontend functionality)

### Project Structure

```
url-short/
├── app.py              # FastAPI application
├── static/             # Frontend files
│   ├── index.html     # Main HTML file
│   ├── styles.css     # CSS styles
│   └── script.js      # Frontend JavaScript
├── requirements.txt    # Python dependencies
├── Dockerfile         # Application container
└── docker-compose.yml # Service orchestration
```

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details. 