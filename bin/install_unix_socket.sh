#!/usr/bin/env bash
# It is designed for using in production with nginx.
# See nginx.conf.example.

echo '[unix] Applying environment variables and configs...'
cp .env.prod.dist .env
cp docker-compose.prod.yml.dist docker-compose.yml

cat .env
echo

./bin/.install_common.sh

# Disable indexing by honorable crawlers.
cp ./docker/prod/app/robots.txt ./data/app/gogs/robots.txt

# Fix permissions for socket dir.
chown 1000:1000 ./var/run
