FROM node:lts-alpine

ARG MONGO_URL

ENV MONGO_URL=${MONGO_URL}

USER node

RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY --chown=node:node . .

RUN npm install

EXPOSE 3000

CMD [ "npm", "start" ]