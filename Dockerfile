FROM node:14-alpine

RUN mkdir -p /home/app

COPY package.json /home/app

WORKDIR /home/app

RUN npm install

EXPOSE 8080

CMD ["node", "server.js"]
