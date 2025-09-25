# Use Node 18 as base image (stable for production)
FROM node:18

# Set working directory inside container
WORKDIR /usr/src/app

# Copy only package files first (for caching npm install)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project files
COPY . .

# Expose app port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
