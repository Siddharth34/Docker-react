FROM node:alpine as ai
WORKDIR /var/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM ngnix
EXPOSE 80
COPY --from=ai /var/app/build /usr/share/nginx/html
