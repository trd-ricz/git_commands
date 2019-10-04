#!/bin/bash

#
#  !!!!! need run in your local. not workspace on docker
#

#path to key file
if [ -z $1 ]; then
  SSH_KEY=
else
  SSH_KEY="-i $1"
fi


SSH_USER=projects@45.77.27.47

TAR_FILE=sample.tar.gz
SSH_PARAMS="${KEY_FILE} ${SSH_USER}"
DATE=`date +%Y%m%d_%H-%M-%S`
DEPLOY_DIR=$HOME/projects/

####################################
# ssh upload
####################################
# upload
/usr/bin/scp ${SSH_KEY} ${TAR_FILE} ${SSH_USER}:${DEPLOY_DIR} -o StrictHostKeyChecking=no

#################
# comands prepare
#################
cmds=()

# unzip
cmds[0]="cd ${DEPLOY_DIR};"
echo "yehey!"


#################
# exec commands
#################
ssh ${SSH_KEY} ${SSH_USER} -o "StrictHostKeyChecking no" ${cmds[*]}