# build environment
FROM node:14-alpine as build
WORKDIR /app
COPY package.json yarn.lock .env ./
RUN yarn install --frozen-lockfile
COPY . .
RUN yarn build

# production environment
FROM nginx:stable-alpine
RUN apk add --update nodejs npm
COPY --from=build /app/nginx.conf /etc/nginx/conf.d/default.conf    
COPY --from=build /app/node_modules/cra-envs/package.json ./cra-envs-package.json
RUN npm i -g cra-envs@`node -e 'console.log(require("./cra-envs-package.json")["version"])'`
WORKDIR /usr/share/nginx
COPY --from=build /app/build ./html
# Needed for knowing what envs we are allowed to inject (an applying the correct defaults)
COPY --from=build /app/.env .
# (optional) For being able to deduce the %PUBLIC_URL% from the "homepage" field.
COPY --from=build /app/package.json .
# (optional) For being able to re-render the public/index.html file that is infact an .ejs file.
COPY --from=build /app/public/index.html ./public/
ENTRYPOINT sh -c "npx embed-environnement-variables && nginx -g 'daemon off;'"
