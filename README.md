# kong31-wallarm

Docker image with Kong 3.1.1-ubuntu and Wallarm 4.6 - https://hub.docker.com/r/dmikhin/kong31-wallarm

Example of execution:
```
docker run -it --rm --name kong \
    -e 'KONG_DATABASE=off' \
    -e 'KONG_PROXY_ACCESS_LOG=/dev/stdout' \
    -e 'KONG_ADMIN_ACCESS_LOG=/dev/stdout' \
    -e 'KONG_PROXY_ERROR_LOG=/dev/stderr' \
    -e 'KONG_ADMIN_ERROR_LOG=/dev/stderr' \
    -e 'KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl' \
    -e 'KONG_DECLARATIVE_CONFIG_STRING={"_format_version":"1.1", "services":[{"host":"mockbin.com","port":443,"protocol":"https", "routes":[{"paths":["/"]}]}]}' \
    -e 'WALLARM_API_HOST=api.wallarm.com' \
    -e 'WALLARM_API_TOKEN=<put your token here>' \
    -e 'TARANTOOL_MEMORY_GB=1' \
    -e 'WALLARM_MODE=block' \
    -p 8000:8000 \
    -p 8443:8443 \
    -p 8001:8001 \
    -p 8444:8444 \
    dmikhin/kong31-wallarm:latest
```