#!/bin/bash

CI_TEST=${TEST}
SEARCH=${TEST}
REPLACE="Hello"

sed -i'.bak' 's/${TEST}/$REPLACE/' ./sample-page/.env;
