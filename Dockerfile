FROM node:16.14.2-alpine
LABEL MAINTAINER="Ramazan (3h024d4hi@mozmail.com)"
LABEL org.opencontainers.image.authors="Ramazan (3h024d4hi@mozmail.com)"

# Create a directory where our app will be placed
RUN mkdir -p /usr/src/app

# Change directory so that our commands run inside this new directory
WORKDIR /usr/src/app

# Copy application
COPY package.json package-lock.json src/*.js ./

# Install dependencies
RUN npm ci --production

# Expose the port the app runs in
EXPOSE 4000

# Serve the app
CMD ["node", "index.js"]
