FROM node:18-alpine

WORKDIR /app

# Copia os arquivos do monorepo
COPY package*.json ./
COPY backend/package*.json ./backend/
COPY packages/ ./packages/

# Instala as dependências
RUN npm ci

# Compila o backend
RUN npm run build --workspace=backend

EXPOSE 3000

CMD ["npm", "run", "start", "--workspace=backend"]
