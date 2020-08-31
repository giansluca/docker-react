FROM node:12.17.0-buster-slim as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build 

FROM nginx:1.19.0-alpine
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html


