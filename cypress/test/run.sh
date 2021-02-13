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
  -i VALUE   run with installation
  -e VALUE   run in which environment
EOM
  exit 2
}

INSTALL=false
ENVIROMENT=false
# params
while getopts "ie:h" optKey; do
  case "$optKey" in
    i)
      INSTALL=true
      ;;
    e)
      ENVIROMENT=${OPTARG}
      ;;
    '-h'|'--help'|* )
      usage
      ;;
  esac
done

checkRequireParams () {
if [ ${ENVIROMENT} = false ]; then
  echo "execution faild! Required ENV... (-e development or -e staging)"
  exit;
else
  ENV=${ENVIROMENT}
fi
}

echo "INSTALL=${INSTALL}"
echo "ENVIROMENT=${ENVIROMENT}"

replaceEnv () {
  cp cypress.${ENV}.json cypress.json
}

runWithInstall () {
  if "${INSTALL}"; then
    rm -rf node_modules/
    ./node_modules/.bin/cypress install
  fi
}

runTest () {
  ./node_modules/.bin/cypress run
}

rollBackSettings () {
  echo "rollback settings"
  cp cypress.local.json cypress.json
}

#check params
checkRequireParams

#change cypess env
replaceEnv

#install
runWithInstall

#run test
runTest

#rollback
rollBackSettings