# Use the official Python image from the Docker Hub
FROM python:3.10-slim

# Install system dependencies for mysqlclient
RUN apt-get update && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    pkg-config python3-dev \
     default-libmysqlclient-dev \
     build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install the necessary dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire application code to the container
COPY . .

EXPOSE 8080

# Initialize the database
#CMD ["python", "init_db.py"] && ["flask", "run", "--host=0.0.0.0"]
CMD ["flask", "run", "--host","0.0.0.0", "--port", "8080"]
