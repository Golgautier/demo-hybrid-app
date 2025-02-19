# Use the official Node.js image as the base image
FROM node:18-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Set environment variables for MariaDB connection
# ENV DB_HOST=10.55.82.177
# ENV DB_USER=admin
# ENV DB_PASSWORD=nutanix/4u
# ENV DB_NAME=myapp

# Build the application
RUN npm run build

# Expose the port the app runs on
EXPOSE 8080

# Start the application
CMD ["npm", "start"]
