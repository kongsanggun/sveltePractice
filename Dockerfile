FROM node:14-alpine

WORKDIR /usr/src/app

COPY *.config.js ./
COPY package*.json ./

RUN sudo npm install

COPY ./src ./src
COPY ./static ./static

RUN sudo npm run build

EXPOSE 5000

ENV HOST=0.0.0.0

CMD [ "npm", "start" ]