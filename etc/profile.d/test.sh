VIM_RC_FILE=~/.vimrc
SYNTAX_OFF="syntax off"

echoLog(){
 echo $* 2>&1 | tee -a setup.log
}

strInFile(){
   str=$1
   fname=$2
   echoLog SEARCHING for String \"$str\" in File $fname
   echoLog EXECUTING: cat $fname \| grep -o "$str" \| wc -l
   found=$(cat $fname | grep -o "$str" | wc -l)
   echoLog STRING \"$str\" found = $found instances
  [ ! $found -eq 0 ]
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
 
turnOffSyntaxColors
