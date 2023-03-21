#!/bin/bash

set -ex

/build/busybox wget https://meganode.wallarm.com/4.6/wallarm-4.6.0.x86_64-glibc.tar.gz -O - | tar -xzv -C /
chown -R kong:kong /opt/wallarm

cp -v /build/docker-entrypoint.sh /docker-entrypoint.sh
cp -v /build/nginx.lua /usr/local/share/lua/5.1/kong/templates/nginx.lua
cp -v /build/nginx_kong.lua /usr/local/share/lua/5.1/kong/templates/nginx_kong.lua
chown -R kong:kong /usr/local/share/lua/5.1/kong/templates
sed -i -e '/HOST=0\.0\.0\.0/d' /opt/wallarm/env.list

rm -rf /build
