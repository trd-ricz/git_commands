#!/bin/bash

CI_TEST=$TEST
ENV_TEST='$TEST'
sed -i'.bak' "s/${ENV_TEST}/${CI_TEST}/" ./sample-page/.env;
