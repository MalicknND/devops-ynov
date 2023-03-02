FROM node:lts

WORKDIR /website

RUN apt update && apt install -y git
RUN git clone https://github.com/missating/nodejs-todo .
RUN npm install

EXPOSE 3000

ENTRYPOINT node /website/index.js
