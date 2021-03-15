# Demo setup for [react-envs](https://github.com/garronej/react-envs)

This is an hello world app to demonstrate how to setup [react-envs](https://github.com/garronej/react-envs)
in your project.

# Highlights

```bash
yarn add react-envs 
```

[`package.json`](https://github.com/garronej/react-envs/blob/main/package.json)
```json
"scripts": {
    "postinstall": "generate-typed-env-getter",
    "prestart": "generate-typed-env-getter",
    "pretest": "generate-typed-env-getter"
}
```
Those scripts are optional, as long as you remember to rerun `npx generate-typed-env-getter`
each time you update `.env` you are good.

[`.gitignore`](https://github.com/garronej/react-envs-demo-app/blob/main/.gitignore)
```ini
/src/env.ts
```
env.ts is a generated file, you don't want it tracked by git.


[`Dockerfile`](https://github.com/garronej/react-envs-demo-app/blob/main/Dockerfile)
```dockerfile
ENTRYPOINT sh -c "npx embed-environment-variables && nginx -g 'daemon off;'"
```



See [complete `Dockerfile`](TODO) example. TODO: Link example




## In development environment

```bash
yarn
REACT_APP_BAZ="Value of baz passed inline" yarn start
```

![image](https://user-images.githubusercontent.com/6702424/111223899-09e26d00-85de-11eb-84ea-566f9ed58eee.png)

## In production environment

```bash
docker build -t garronej/react-envs-demo-app:main .

docker run -it --env BAZ="Value of baz on the server" -p 8083:80 garronej/react-envs-demo-app:main
```
Reach http://localhost:8083

![image](https://user-images.githubusercontent.com/6702424/111223405-685b1b80-85dd-11eb-977c-e8ea1eda1e29.png)

