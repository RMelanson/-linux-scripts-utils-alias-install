#!/bin/bash
set -o vi
export PS1="[\u@\h:\w ] $ "

startUpAliasFilesDir="/etc/profile.d/startUpAliasFiles/"
SOURCE_DIR=$startUpAliasFilesDir/user_env
USER_ENV_DIR=~/.env
VIM_RC_FILE=~/.vimrc
SYNTAX_OFF="syntax off"

SET_ENV=". $USER_ENV_DIR/.e"

echoLog(){
 echo $* 2>&1 | tee -a setup.log
}

strInFile(){
   str=$1
   fname=$2
   echoLog Searching for String $str in File $fname
   echoLog EXECUTING: cat $fname \| grep -o "$str" \| wc -l
   found=$(cat $fname | grep -o "$str" | wc -l)
   echoLog string found = $found
  [ ! $found -eq 0 ]
}

updateBashrc(){
  if strInFile "$SET_ENV" ~/.bashrc
   then
     echoLog LAUNCH BASH ENVIRONMENT ALIASE\'S ALREADY INSTALLED
  else
    echoLog \#LAUNCH BASH ENVIRONMENT ALIASE\'S SETTINGS >> ~/.bashrc
    echoLog EXECUTING: echo $SET_ENV \>\> ~/.bashrc
    echoLog $SET_ENV >> ~/.bashrc
  fi
}

turnOffSyntaxColors() {
  if [ -f "$VIM_RC_FILE" ]
  then {
    echoLog $VIM_RC_FILE EXISTS
    if strInFile "$SYNTAX_OFF" ~/.vimrc
     then
       echoLog SYNTAX STRING \"$SYNTAX_OFF\" EXISTS IN FILE $VIM_RC_FILE
       echoLog NOT SETTING \"$SYNTAX_OFF\" in FILE $VIM_RC_FILE
    else
      echoLog TURNING OFF BASH VIM SYNATX COLORS
      echoLog INSERTING $SYNTAX_OFF INTO FILE $VIM_RC_FILE
      echoLog EXECUTING: echo $SYNTAX_OFF \>\> ~/.vimrc
      echo $SYNTAX_OFF >> ~/.vimrc
  fi
  }
  else {
      echoLog FILE $VIM_RC_FILE DOES NOT EXIST CREATING SETTING $SYNTAX_OFF
      echoLog EXECUTING: echo $SYNTAX_OFF \>\> ~/.vimrc
      echo $SYNTAX_OFF >> ~/.vimrc
  }
  fi
}
 
setBashEnv(){
  if [ -d "$USER_ENV_DIR" ]
    then {
      echoLog "DIRECTORY $USER_ENV_DIR exists."
    }
    else {
      echoLog "DIRECTORY $USER_ENV_DIR Not Found."
      echoLog "EXECUTING: cp -rf $SOURCE_DIR $USER_ENV_DIR"
      cp -rf $SOURCE_DIR $USER_ENV_DIR
      echoLog 766 $USER_ENV_DIR
      chmod 766 $USER_ENV_DIR
      echoLog EXECUTING: $SET_ENV
      $SET_ENV
    }
  fi
}
displayAliasMenu(){
  echoLog EXECUTING  '. $USER_ENV_DIR/.e'
  clear
  . $USER_ENV_DIR/.e
}

echoLog "SETTING ENV"
setBashEnv
updateBashrc
turnOffSyntaxColors
displayAliasMenu
