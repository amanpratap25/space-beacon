# Use an official Python runtime as the base image
FROM python:3.9-slim

# Label for metadata
LABEL maintainer="Aman Pratap Kushwaha"

# Set the working directory in the container
WORKDIR /app

# Copy the required files to the container
COPY requirements.txt ./
COPY app.py ./

# Install the required Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 80 to allow external access
EXPOSE 80

# Set the command to run when the container starts
CMD ["python", "app.py"]
