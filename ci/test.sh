#!/bin/bash

CI_TEST=$TEST
TEST='${VAR}'
sed -i'.bak' "s/${TEST}/$CI_TEST/" ./sample-page/.env;
