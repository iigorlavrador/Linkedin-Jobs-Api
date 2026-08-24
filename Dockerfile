FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build --workspace=backend

EXPOSE 3000

CMD ["npm", "run", "start", "--workspace=backend"]
