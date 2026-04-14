FROM node:20-alpine3.20

RUN apk update && \
    apk upgrade --no-cache && \
    rm -rf /var/cache/apk/*

WORKDIR /app

COPY package*.json ./
COPY front-end/package*.json ./front-end/

WORKDIR /app/front-end

RUN npm install

WORKDIR /app
COPY . .

WORKDIR /app/front-end
RUN npm run build

EXPOSE 4173

CMD ["npm", "run", "preview"]