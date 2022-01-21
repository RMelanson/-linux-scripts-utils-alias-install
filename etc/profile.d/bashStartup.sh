#!/bin/bash
set -o vi
export PS1="[\u@\h:\w ] $ "

startUpAliasFilesDir="/etc/profile.d/startUpAliasFiles/"
SOURCE_DIR=$startUpAliasFilesDir/user_env
USER_DIR=~/.env
SET_ENV=". $USER_DIR/.e"

echoLog(){
 echo $* 2>&1 | tee -a setup.log
}


if [ -d "$USER_DIR" ];
then {
    echo "DIRECTORY $USER_DIR exists."
}
else {
    echoLog "DIRECTORY $SOURCE_DIR Not Found."
    echoLog "EXECUTING: cp -rf $SOURCE_DIR $USER_DIR"
    cp -rf $SOURCE_DIR $USER_DIR
    echoLog 766 $USER_DIR
    chmod 766 $USER_DIR
    echoLog EXECUTING: $SET_ENV
    $SET_ENV
}
fi
