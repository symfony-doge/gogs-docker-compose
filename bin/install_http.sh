#!/usr/bin/env bash
# It is designed for using on a local machine.
# See install_unix_socket for production hints.

echo '[http] Applying environment variables and configs...'
cp .env.dev.dist .env
cp docker-compose.dev.yml.dist docker-compose.yml

cat .env
echo

./bin/.install_common.sh
