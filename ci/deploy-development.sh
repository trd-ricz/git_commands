#!/bin/bash
# Usage: bash ci/deploy-eb.sh

CIRCLE_BRANCH=development

set -xeu

#cd react_ld

#cp docker-compose.yml
#docker network create shared

# docker-compose up -d 
# docker-compose up -d

# install npm
cd sample-page

yarn install

# build project
yarn run build

#zip build file
tar -zcvf sample.tar.gz build/*

bash push-development.sh
