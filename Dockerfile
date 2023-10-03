FROM node:14-alpine

WORKDIR ./src

COPY *.config.js ./
COPY package*.json ./

RUN npm install

COPY ./src ./src
COPY ./static ./static

RUN npm run build

EXPOSE 5000

ENV HOST=0.0.0.0

CMD [ "npm", "start" ]