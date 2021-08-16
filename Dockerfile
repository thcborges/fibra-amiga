FROM node:lts-alpine

WORKDIR /app

COPY ./client/package*.json  .

RUN npm install

COPY client .

RUN yarn add nuxt

EXPOSE 3000
CMD yarn dev