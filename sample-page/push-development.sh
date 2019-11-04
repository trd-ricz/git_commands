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


echo "SSH_KEY"
echo $SSH_KEY


#SSH_USER=project@45.77.27.47

#TAR_FILE=sample.tar.gz
#SSH_PARAMS="${KEY_FILE} ${SSH_USER}"
#DATE=`date +%Y%m%d_%H-%M-%S`
#DEPLOY_DIR=/home/project/

####################################
# ssh upload
####################################
# upload
#/usr/bin/scp -o "StrictHostKeyChecking no" ${SSH_KEY} ${TAR_FILE} ${SSH_USER}:${DEPLOY_DIR}

#################
# comands prepare
#################
#################
# comands prepare
#################
#cmds=()

# change dir
#cmds+=("cd ${DEPLOY_DIR};")

# unzip
#cmds+=("echo unzip...;")
#cmds+=("rm -rf tmp_html;")
#cmds+=("mkdir tmp_html;")
#cmds+=("tar -zxf ${TAR_FILE} -C tmp_html/;")

## backup
#cmds+=("echo backup...;")
#cmds+=("rm -rf backup_html_*;")
#cmds+=("cp -rp html/ backup_html_${DATE}/;")

## deploy
#cmds+=("echo deploy...;")
#cmds+=("rm -rf html/;")
#cmds+=("cp -rp tmp_html/ html/;")

## remove no need files
#cmds+=("echo remove deploy files...;")
#cmds+=("rm ${TAR_FILE};")
#cmds+=("rm -rf tmp_html/;")



#################
# exec commands
#################
#ssh ${SSH_KEY} ${SSH_USER} -o "StrictHostKeyChecking no" ${cmds[*]} 