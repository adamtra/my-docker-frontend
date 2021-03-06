FROM node:alpine as mybuild
WORKDIR /opt/app
COPY package.json .
COPY yarn.lock .
RUN yarn install
COPY . .
RUN yarn build

FROM nginx
COPY --from=mybuild /opt/app/build /usr/share/nginx/html