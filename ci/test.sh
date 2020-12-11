#!/bin/bash

CI_TEST=tetetetete

sed -i'.bak' 's/${TEST}/${CI_TEST}/g' ./sample-page/.env;
