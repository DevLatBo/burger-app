FROM node:15-alpine3.13 as build
WORKDIR /app
COPY ./package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.19.10-alpine
COPY --from=build /app/build /usr/share/nginx/html

CMD ["nginx","-g","daemon off;"]


