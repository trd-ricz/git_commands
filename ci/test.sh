#!/bin/bash

CI_TEST=$TEST

sed -i'.bak' "s/$ENVTEST/${CI_TEST}/g" ./sample-page/.env;
