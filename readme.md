Przed uruchomieniem należy zmapować localhosta:
Na linuxie należy wykonać następujące polecenia z wykładu:
    ```sudo nano /etc/hosts``` 
    ```127.0.0.1 test.com```

Następnie:

```
docker build -t lab6-3-flask . (W folderze flask)
docker build -t lab6-3-express . (W folderze express)

docker container run -d --name postgres --label traefik.port=5432 -v "/home/kali/zad6-3tbk/db":/docker-entrypoint-initdb.d -v pg-data:/var/lib/postgresql/data -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=mysecretpassword -e POSTGRES_DB=db postgres:11.5-alpine
docker container run --rm -d --name express --label traefik.enable=true --label traefik.port=3000 --label traefik.priority=1 --label traefik.http.routers.express.rule="Host(\"test.com\")" lab6z3-express
docker container run --rm -d --name flask --label traefik.enable=true --label traefik.port=5000 --label traefik.priority=10 --label traefik.http.routers.flask.rule="Host(\"test.com\") && PathPrefix(\"/cars\")" lab6z3-flask

docker run -d --name traefik -p 8080:8080 -p 80:80 -v /var/run/docker.sock:/var/run/docker.sock traefik:latest --api.insecure=true --providers.docker
```

Zapytania:
* http://test.com/cars
* http://test.com/cars?year=2020
* http://test.com/addCar (w postmanie body -> raw -> JSON: ```{
  "model": "testCar",
  "year": 2001,
  "details": "details"
  }```)
