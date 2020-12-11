#!/bin/bash

SEARCH="REPLACETHISTEXT"
REPLACE="Hello"

sed -e "s/$SEARCH/$REPLACE/" ./sample-page/.env;
