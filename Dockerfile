FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
COPY backend/package*.json ./backend/

RUN npm ci

RUN npx tsc -p backend/tsconfig.json

EXPOSE 3000

CMD ["npm", "run", "start", "--workspace=backend"]
