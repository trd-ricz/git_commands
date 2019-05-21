#!/bin/bash
# Usage: bash ci/deploy-eb.sh

CIRCLE_BRANCH=development

set -xeu

cd sample-page
tar -zcvf sample.tar.gz *

bash push-development.sh 
