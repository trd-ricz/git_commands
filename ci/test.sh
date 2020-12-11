#!/bin/bash

CI_TEST=$TEST

sed -i'.bak' 's/${TEST}/${CI_TEST}/g' ./sample-page/.env;
