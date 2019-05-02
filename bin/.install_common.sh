#!/usr/bin/env bash

source .env

echo "[$APP_ENV] Stopping docker-compose services..."
docker-compose down
echo

echo "[$APP_ENV] Clearing docker volumes..."
docker volume rm gogs_app_data gogs_db_data
docker volume prune --force
mkdir -p ./data/db/data
echo

echo "[$APP_ENV] Starting docker-compose services..."
docker-compose up -d
echo

echo "[$APP_ENV] Applying application config..."
cp ./docker/$APP_ENV/app/app.ini ./data/app/gogs/conf/app.ini

cat ./data/app/gogs/conf/app.ini
