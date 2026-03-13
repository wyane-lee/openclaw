# Use a Node.js image suitable for the OpenClaw codebase
FROM node:20-slim

# Install necessary runtime dependencies (e.g., Chromium)
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy application code
COPY . .

# Install dependencies
RUN npm install

# Build the application
RUN npm run build

# Expose the default OpenClaw port
EXPOSE 8080

# Run the application
CMD ["npm", "start"]
