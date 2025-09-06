# Use the latest Node.js base image
FROM node:latest  

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first (better layer caching)
COPY nodeapp/package*.json ./  

# Install dependencies
RUN npm install  

# Copy the rest of the application code
COPY nodeapp/ .  

# Expose port 3000
EXPOSE 3000  

# Start the application
CMD ["npm", "start"]
