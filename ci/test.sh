#!/bin/bash

CI_TEST="${TEST:-}"

echo "${TEST}"

sed -i'.bak' "s/${TEST}/${CI_TEST}/g" ./sample-page/.env;
