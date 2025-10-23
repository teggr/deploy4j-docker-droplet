#!/bin/bash

# Build script for deploy4j-docker-droplet
# This script builds the Docker image

IMAGE_NAME="deploy4j-docker-droplet"
IMAGE_TAG="latest"

echo "Building Docker image: ${IMAGE_NAME}:${IMAGE_TAG}"
docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .

if [ $? -eq 0 ]; then
    echo "Build successful!"
    echo "Image: ${IMAGE_NAME}:${IMAGE_TAG}"
else
    echo "Build failed!"
    exit 1
fi
