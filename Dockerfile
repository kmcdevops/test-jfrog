# Use an official OpenJDK base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy everything from repo to container
COPY . /app

# Default command (can be any for testing)
CMD ["echo", "Docker build successful!"]
