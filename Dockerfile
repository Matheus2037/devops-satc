FROM node:20-alpine

WORKDIR /app

COPY . .

WORKDIR /app/front-end

RUN npm install

RUN apk upgrade zlib

RUN apt-get update && apt-get install -y --no-install-recommends zlib1g && rm -rf /var/lib/apt/lists/*

RUN npm run build

EXPOSE 4173

CMD ["npm", "run", "preview"]
