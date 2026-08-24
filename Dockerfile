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
