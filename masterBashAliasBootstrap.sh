# is_root_user: Determine if current user is root (id = 0)
echoLog(){
 echo $* 2>&1 | tee -a setup.log
}

is_root_user(){
  [ $(id -u) -eq 0 ]
}

# is_sudo_user: Determine if current user is sudo user
is_sudo_user(){
  [ "$(getent group wheel | grep $(whoami))" != "" ]
}

# execute_as_root: execute as root if root user or has sudo access
execute_as_root(){
  echoLog "EXECUTING: "$@
  if is_root_user
  then {
    echoLog EXECUTING AS ROOT USER command $*
    $*
  }
  else {
    if is_sudo_user
    then {
      echoLog EXECUTING sudo $*
      sudo $*
    }
    else {
      echoLog NO ROOT OR SUDO ACCESS FOR USER $(whoami)
      echoLog COMMAND $*
      echoLog NOT EXECUTED UNDER ROOT
    }
    fi
  }
  fi
}

echoLog execute_as_root cp -r etc/profile.d/\* /etc/profile.d
execute_as_root cp -r etc/profile.d/* /etc/profile.d
echoLog execute as_root chmod 711  etc/profile.d/startUpAliasFiles
execute_as_root chmod 711  etc/profile.d/startUpAliasFiles
