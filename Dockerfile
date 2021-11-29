FROM node:14-alpine
COPY package.json package-lock.json ./
RUN npm install &&\
    npm cache clean --force &&\
    npm audit fix

COPY . .

CMD npm start

EXPOSE 4000
