FROM node:18-alpine

WORKDIR /app

RUN npm install -g pm2

COPY . .

RUN npm install

RUN npm run build

EXPOSE 5000
CMD [ "pm2", "start", "./build/index.js" ]