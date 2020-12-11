#!/bin/bash

CI_TEST=$TEST
TEST="${TEST}"
sed -i'.bak' "s/${TEST}/$CI_TEST/" ./sample-page/.env;
