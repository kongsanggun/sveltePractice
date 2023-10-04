FROM node:18-alpine

WORKDIR /app

RUN npm install -g pm2

COPY . .

RUN npm install

EXPOSE 3000

RUN npm run build

CMD [ "pm2", "start", "./build/index.js", "--", "--host"]