set -ex

docker build --pull \
 --tag dmikhin/kong31-wallarm:latest .
docker push dmikhin/kong31-wallarm:latest
