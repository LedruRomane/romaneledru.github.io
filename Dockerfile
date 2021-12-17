FROM node:12.16.3-alpine3.9

RUN mkdir -p /var/www/mixpro
WORKDIR /var/www/mixpro

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

ENV NUXT_HOST=mixpro

ENV NUXT_PORT=3000

CMD [ "npm", "dev" ]