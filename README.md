# Demo setup for [react-envs](https://github.com/garronej/embed-environnement-variables)

## In development environment

```bash
REACT_APP_BAZ="Value of baz passed inline" yarn start
```

![image](https://user-images.githubusercontent.com/6702424/111198629-0dff9200-85c0-11eb-873b-42aac78a2a4e.png)

## In production environment

```bash
docker build -t garronej/react-envs-demo-app:main .

BAZ="Value of baz on the server" docker run -it -p 8083:80 garronej/react-envs-demo-app:main
```
Reach http://localhost:8083
