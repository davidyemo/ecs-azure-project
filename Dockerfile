# Use the official Python slim image as the base image
FROM python:3.13.3-slim

# Set the working directory inside the container
WORKDIR /app

# Expose port 3000 for the Flask application
EXPOSE 3000

# Copy requirements file first to leverage Docker layer caching
COPY app/requirements.txt .

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy the application code into the container
COPY app/ .

# Start the Flask application
CMD ["python3", "app.py"]