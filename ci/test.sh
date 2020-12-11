#!/bin/bash

CI_TEST=${TEST}
SEARCH=${TEST}
REPLACE="Hello"

sed -i'.bak' 's/$SEARCH/$REPLACE/g' ./sample-page/.env;
