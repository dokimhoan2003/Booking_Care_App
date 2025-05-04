# Booking Care Application

A platform designed to support healthcare appointment scheduling. It enables doctors to view their personal schedules, access patient visit history, and assists in managing departments and medical staff.

## Features

- ♨️ Integration Cloudinary to handle image uploads
- 💬 View weekly appointments
- 📚 Managing appointments, doctors, and medical departments
- 👥 User authentication and account management
- 📱 Responsive design for desktop and mobile

## Tech Stack

### Frontend

- ReactJS with JavaScript
- TailwindCSS for styling
- React Router for navigation
- Ant Design

### Backend

- Spring Boot 3
- Spring Security with JWT
- Spring Data JPA
- MySQL for data storage

### Infrastructure

- Docker & Docker Compose
- NGINX for frontend hosting

## Prerequisites

- Docker & Docker Compose
- Git
- NVIDIA GPU with CUDA support (recommended but not required)

## Quick Start with Docker

The fastest way to get started is using Docker Compose:

```bash
# Clone the repository
git clone https://github.com/dokimhoan2003/Booking_Care_App.git
cd Booking_Care_App

# Start all services
cd BookingCare_Application
docker-compose up --buid

```

After the services are running, access:

- Web App: http://localhost:3000
- API: http://localhost:8081

## Troubleshooting Docker Setup

### Connection Issues

If the frontend can't connect to the backend:

- Check NGINX configuration in `docker/nginx/default.conf`
- Verify network connectivity: `docker network inspect bookingcare-network`

## Development Setup

### Frontend Development (Local)

```bash
cd BookingCare_Application/BookingCare-FE

# Install dependencies
npm install

# Start development server
npm run start

# Build for production
npm run build
```

### Backend Development (Local)

```bash
cd BookingCare_Application/BookingCare-BE

# Run using Maven
./mvnw spring-boot:run

# Package as JAR
./mvnw package

# Run with specific profile
java -jar target/*.jar
```
