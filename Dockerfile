FROM node:12.17.0-buster-slim as builder
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
RUN npm run build 

FROM nginx:1.19.0-alpine
COPY --from=builder /app/build /usr/share/nginx/html


