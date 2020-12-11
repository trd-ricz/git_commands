#!/bin/bash

CI_TEST=$1

echo $1
echo ${CI_TEST}

sed -i'.bak' "s/${TEST}/${CI_TEST}/g" ./sample-page/.env;
