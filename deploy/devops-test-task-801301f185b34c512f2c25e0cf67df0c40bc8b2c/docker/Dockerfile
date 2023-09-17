FROM node:latest

COPY ["app", "/app"]

WORKDIR /app

RUN npm install

EXPOSE 9007

CMD ["npm", "start"]