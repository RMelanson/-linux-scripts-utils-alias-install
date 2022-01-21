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

cp etc/profile.d/startUpAliasFiles/.user_env/ ~/.env
. ~/.env/.a
