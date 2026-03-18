FROM node:20-alpine

WORKDIR /app

COPY . .

WORKDIR /app/front-end

RUN npm install

RUN npm run build

EXPOSE 4173

CMD ["npm", "run", "preview"]
