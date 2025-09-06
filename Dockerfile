# Use the latest Node.js base image
FROM node:latest  

# Set working directory inside container
WORKDIR /usr/src/app   

# Copy package.json & package-lock.json first (better layer caching)
COPY nodeapp/package*.json ./  

# Install dependencies
RUN npm install  

# Copy the rest of the application code
COPY nodeapp/ .  

# Expose app port
EXPOSE 3000  

# Run the app
CMD ["npm", "start"]
