# --- Stage 1: base image with source mounted in dev mode ----------
FROM node:22-alpine

# The work directory inside the container
WORKDIR /usr/src/app

# Copy only the package manifest files first, then install deps
COPY package*.json ./
RUN npm install

# Copy the rest of the source (your volume mount will live-reload, too)
COPY . .

# Dev-time command (uses nodemon / ts-node via Nest’s start:dev)
CMD ["npm", "run", "start:dev"]
