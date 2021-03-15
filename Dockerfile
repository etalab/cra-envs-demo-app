# build environment
FROM node:14.16.0-alpine as build
WORKDIR /app
COPY package.json yarn.lock .env ./
RUN yarn install --frozen-lockfile
COPY . .
RUN yarn build

# production environment
FROM nginx:stable-alpine
COPY --from=build /app/nginx.conf /etc/nginx/conf.d/default.conf    
WORKDIR /app
COPY --from=build /app/build ./build
COPY --from=build /app/.env .
COPY --from=build /app/node_modules/react-envs/package.json ./re.json
RUN apk add --update nodejs npm
RUN npm i -g react-envs@`node -e 'console.log(require("./re.json")["version"])'`
RUN rm -r /usr/share/nginx/html
ENTRYPOINT sh -c "npx embed-environnement-variables && mv build /usr/share/nginx/html && nginx -g 'daemon off;'"