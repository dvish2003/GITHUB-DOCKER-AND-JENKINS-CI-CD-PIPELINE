# Use the latest version of the Node.js image as the base image
FROM node:18  

# Set the working directory inside the container
WORKDIR /usr/src  

# Copy package files first (for better caching)
COPY nodeapp/package*.json ./  

# Install dependencies
RUN npm install  

# Copy the rest of the app
COPY nodeapp/ ./  

# Expose port 3000
EXPOSE 3000  

# Start the application
CMD ["npm", "start"]
