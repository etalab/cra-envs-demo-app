# Demo setup for [react-envs](https://github.com/garronej/embed-environnement-variables)

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

