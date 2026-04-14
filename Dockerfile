FROM node:20-alpine:3.20.2

RUN apt-get update && apt-get install -y --no-install-recommends zlib1g && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

WORKDIR /app/front-end

RUN npm install

RUN apk upgrade zlib


RUN npm run build

EXPOSE 4173

CMD ["npm", "run", "preview"]
