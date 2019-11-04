#!/bin/bash
# Usage: bash ci/deploy-eb.sh

CIRCLE_BRANCH=development


if [ -z $1 ]; then
  SSH_KEY=
else
  SSH_KEY="-i $1"
fi





echo SSH_KEY

set -xeu

#cd react_ld

#cp docker-compose.yml
#docker network create shared

# docker-compose up -d 
# docker-compose up -d

# install npm
cd sample-page

node --version

#yarn install

# build project
#yarn run build

#zip build file
#tar -zcvf sample.tar.gz build/*

#bash push-development.sh
