# docker-mosquitto
Docker container for (Mosquitto MQTT server)[https://mosquitto.org/].

## Build
```
docker build -t drerik/mosquitto .
```

## Run
```
docker run -p 1883:1883 drerik/mosquitto
```

## Docker-compose
See `docker-compose.yml` example.