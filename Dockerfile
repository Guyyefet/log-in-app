FROM node:14-alpine

RUN mkdir -p /home/app

COPY ./app /home/app

WORKDIR /home/app

RUN npm install

EXPOSE 8080

CMD ["node", "server.js"]
