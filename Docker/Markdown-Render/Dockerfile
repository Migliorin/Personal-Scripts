# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install grip using pip
RUN pip install grip

# Expose the port grip will run on
EXPOSE 6419

# Run the grip command when the container launches
CMD ["grip", ".", "0.0.0.0"]

