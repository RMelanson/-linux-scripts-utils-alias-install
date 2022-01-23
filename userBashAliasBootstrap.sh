#!/bin/bash
USER_ENV_DIR=~/.env
SET_ENV=". $USER_ENV_DIR/.e"

echoLog(){
 echo $* 2>&1 | tee -a setup.log
}

is_current_shell(){
  shell=$0
  echo shell = $shell
  [ $shell = "-bash" ] || [ $shell = "bash" ]
}

if ! is_current_shell
then {
  echoLog ERROR: Not current shell
  echoLog USAGE: . $0
  echoLog EXITING . $0
  exit
}
fi

updateBashrc(){
  if strInFile "$SET_ENV" ~/.bashrc
   then
     echoLog LAUNCH BASH ENVIRONMENT ALIASE\'S ALREADY INSTALLED
  else
    echoLog LAUNCH BASH ENVIRONMENT ALIASE\'S SETTINGS >> ~/.bashrc
    echoLog EXECUTING: echo $SET_ENV \>\> ~/.bashrc
    echoLog $SET_ENV >> ~/.bashrc
  fi
}

setBashEnv(){
  if [ -d "$USER_ENV_DIR" ];
    then {
      echoLog "DIRECTORY $USER_ENV_DIR exists."
    }
    else {
      echoLog "DIRECTORY $SOURCE_DIR Not Found."
      echoLog "EXECUTING: cp -rf $SOURCE_DIR $USER_ENV_DIR"
      cp -rf ./etc/profile.d/startUpAliasFiles/user_env/ $USER_ENV_DIR
      echoLog 766 $USER_ENV_DIR
      chmod 766 $USER_ENV_DIR
      echoLog EXECUTING: $SET_ENV
      $SET_ENV
    }
  fi
}

setBashEnv
updateBashrc
