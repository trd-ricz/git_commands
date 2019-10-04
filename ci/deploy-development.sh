#!/bin/bash
# Usage: bash ci/deploy-eb.sh

CIRCLE_BRANCH=development

set -xeu

cd sample-page

#cp docker-compose.yml
#docker network create shared

# docker-compose up -d 
docker-compose up -d

# install npm
docker-compose exec workspace npm install

# build project
docker-compose exec workspace npm run build

#zip build file
tar -zcvf sample.tar.gz build/*

bash push-development.sh
