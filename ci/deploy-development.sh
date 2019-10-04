#!/bin/bash
# Usage: bash ci/deploy-eb.sh

CIRCLE_BRANCH=development

set -xeu

cd react_ld

#cp docker-compose.yml
#sudo docker network create shared

# docker-compose up -d 
sudo docker-compose up -d

# install npm
sudo docker-compose exec workspace npm install

# build project
sudo docker-compose exec workspace npm run build

#zip build file
tar -zcvf sample.tar.gz build/*

bash push-development.sh
