FROM node:24-bookworm-slim

WORKDIR /app

# Dependencies installieren
COPY package*.json ./
RUN npm ci

# Anwendung kopieren
COPY . .

# Next.js Produktionsbuild
ENV NODE_ENV=production
RUN npm run build

EXPOSE 3000

# Datenbankmigrationen ausführen und Anwendung starten
CMD ["sh", "-c", "npm run db:migrate && npm run start"]
