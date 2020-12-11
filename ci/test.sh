#!/bin/bash

CI_TEST="${TEST:-}"

echo "${CI_TEST}"
echo "${TEST}"
echo $TEST
echo ${CI_TEST}

sed -i'.bak' "s/${TEST}/${CI_TEST}/g" ./sample-page/.env;
