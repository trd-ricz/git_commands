#!/bin/bash

#
#  !!!!! need run in your local. not workspace on docker
#


SSH_USER=root@108.160.134.120

TAR_FILE=sample.tar.gz 
SSH_PARAMS="${SSH_USER}"
DATE=`date +%Y%m%d_%H-%M-%S`
DEPLOY_DIR=/usr/share/nginx/html

####################################
# ssh upload
####################################
# upload
/usr/bin/scp ${TAR_FILE} ${SSH_USER}:${DEPLOY_DIR}  -o "StrictHostKeyChecking no"


#################
# comands prepare
#################
cmds=()

# unzip
cmds[0]="cd ${DEPLOY_DIR};"


#################
# exec commands
#################
ssh ${SSH_PARAMS} -o "StrictHostKeyChecking no" ${cmds[*]}