#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker could not be found. Please install Docker first."
    exit 1
fi

# Run Docker Compose with build
docker-compose up --build

