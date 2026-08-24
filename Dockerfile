FROM node:20-slim

RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    libnss3 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libasound2 \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

WORKDIR /app
COPY package*.json ./
COPY tsconfig.base.json ./
COPY backend/ ./backend/
RUN npm ci
WORKDIR /app/backend
RUN npx tsc
WORKDIR /app
EXPOSE 3000
CMD ["npm", "run", "start", "--workspace=backend"]
