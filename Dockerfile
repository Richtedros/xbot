# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json to the container
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the application to the container
COPY . .

# Install tsx (or other required global tools)
RUN npm install -g tsx

# Expose a port (if your app needs it)
EXPOSE 8080

# Start the bot
CMD ["npx", "tsx", "bin/xbot.ts"]
