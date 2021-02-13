#!/bin/bash

## run inside sac_cypress bash

###---------------------------------------###
### prams help
###---------------------------------------###

set -e
# Any subsequent(*) commands which fail will cause the shell script to exit immediately

trap killgroup SIGINT

killgroup(){
  rollBackSettings
  kill 0
}

function usage {
  cat <<EOM
Usage: $(basename "$0") [OPTION]...
  -h         Display help
  -a VALUE   run by CI
  -i VALUE   run with installation
  -e VALUE   run in which environment
EOM
  exit 2
}
INSTALL=false
ENVIROMENT=false
WORKDIR=test
CI=false

# params
while getopts "iae:h" optKey; do
  case "$optKey" in
    i)
        INSTALL=true
        ;;
    e)
      ENVIROMENT=${OPTARG}
        ;;
    a)
      CI=true
        ;;
    '-h'|'--help'|* )
        usage
        ;;
  esac
done

echo "ENVIROMENT=${ENVIROMENT}"
echo "INSTALL=${INSTALL}"
echo "CI=${CI}"

checkRequireParams () {
if [ ${ENVIROMENT} = false ]; then
  echo "execution faild! Required ENV... (-e development or -e staging)"
  exit;
else
  ENV=${ENVIROMENT}
fi
}

changeDir () {
    cd ${WORKDIR}
}

runWithInstall () {
  if "${CI}"; then
    docker-compose up -d --build cypress
  fi
  if "${INSTALL}"; then
    rm -rf node_modules/
    docker-compose exec -T cypress yarn install
  fi
}

replaceEnv () {
    cp cypress.${ENV}.json cypress.json
}


execCypress () {
    if "${CI}"; then
        cd test/ && bash run.sh -e ${ENV}
    else
        ./node_modules/.bin/cypress open
    fi
}

rollBackSettings () {
  cp cypress.local.json cypress.json
}

#check params
checkRequireParams

#change directory
changeDir

#change cypess env
replaceEnv

#install
runWithInstall

#run test
execCypress

#rollback
rollBackSettings