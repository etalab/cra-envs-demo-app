# Demo setup for [cra-envs](https://github.com/garronej/cra-envs)

This is a "hello world" app to demonstrate how to set up [cra-envs](https://github.com/garronej/cra-envs)
in your project.

## Try it

### In development environment

```bash
yarn
REACT_APP_BAZ="Value of baz passed inline" yarn start
```

![image](https://user-images.githubusercontent.com/6702424/154806188-46c52a04-a5d8-4673-acc8-36bc98f2ee50.png)

### In production environment

```bash
docker build -t garronej/cra-envs-demo-app:main .

docker run -it -p 8083:80 \
    --env BAZ="Value of baz on the server" \
    --env THEME_ID="france" \
    --env HEADER_USECASE_DESCRIPTION="Le banc d'essai du SILL" \
    --env HEADER_ORGANIZATION="Etalab" \
    --env DESCRIPTION="Une plateforme pour essayer les logiciels du SILL" \
    garronej/cra-envs-demo-app:main
```
Reach http://localhost:8083

![image](https://user-images.githubusercontent.com/6702424/154806127-61cc3490-1053-4add-8636-77a0704dc022.png)

## Config highlights

[`package.json`](https://github.com/garronej/cra-envs-demo-app/blob/a3af940b3d2aa53a13bbe82569623a4338df3384/package.json#L14-L16)
```json
"dependencies": {
    "cra-envs": "^1.2.4"
},
"scripts": {
    "postinstall": "generate-env-getter",
    "prestart": "generate-env-getter",
    "pretest": "generate-env-getter"
}
```
Those scripts are optional, as long as you remember to rerun `npx generate-env-getter`
each time you update `.env` you are good.  
Use `generate-env-getter js` to generate `src/env.js` instead of `src/env.ts`.

[`.gitignore`](https://github.com/garronej/cra-envs-demo-app/blob/48b026b7cffb0284948951656b698d8b1f8ebd05/.gitignore#L10)
```ini
/src/env.ts
```
`env.ts` (or `env.js`) is a generated file, you don't want it tracked by git. 

[`Dockerfile`](https://github.com/garronej/cra-envs-demo-app/blob/48b026b7cffb0284948951656b698d8b1f8ebd05/Dockerfile#L18)
```dockerfile
ENTRYPOINT sh -c "npx embed-environment-variables && nginx -g 'daemon off;'"
```
The Docker images generated do **NOT** require an internet connection
nor does it bundle all your `node_modules/`. (Specified because it can look like it at first sight.)
