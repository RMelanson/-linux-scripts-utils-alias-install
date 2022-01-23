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

strInFile(){
   str=$1
   fname=$2
   echoLog Searching for String $str in File $fname
   echoLog EXECUTING: cat $fname \| grep -o "$str" \| wc -l
#   found=$(cat $fname | grep -c "$str")
   found=$(cat $fname | grep -o "$str" | wc -l)
   echoLog string found = $found
  [ ! $found -eq 0 ]
}


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

if ! is_current_shell
then {
  echoLog ERROR: Not current shell
  echoLog USAGE: . $0
  echoLog EXITING . $0
  exit
}
fi

setBashEnv
updateBashrc
