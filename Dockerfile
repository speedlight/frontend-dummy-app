FROM node:14-alpine
USER node
RUN mkdir -p /home/node/app
WORKDIR /home/node/app

COPY --chown=node:node package.json package-lock.json ./

RUN npm install && npm audit fix

COPY --chown=node:node . ./

CMD npm start

EXPOSE 4000
