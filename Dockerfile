FROM node:20-alpine3.20

# CORREÇÃO 1 e 2: Travamos a versão do NPM (ex: 10.8.1) em vez de @latest 
# e adicionamos o --ignore-scripts para evitar execução de código malicioso global
RUN npm install -g npm@10.8.1 --ignore-scripts

RUN apk update && \
    apk upgrade --no-cache && \
    rm -rf /var/cache/apk/*

WORKDIR /app

COPY package*.json ./
COPY front-end/package*.json ./front-end/

WORKDIR /app/front-end

# CORREÇÃO 3: Trocamos 'npm install' por 'npm ci'
RUN npm ci

WORKDIR /app
COPY . .

WORKDIR /app/front-end
RUN npm run build

EXPOSE 4173

CMD ["npm", "run", "preview"]