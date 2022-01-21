#!/bin/bash
set -o vi
export PS1="[\u@\h:\w ] $ "

startUpAliasFilesDir="/etc/profile.d/startUpAliasFiles/"

USER_ALIASES=".a"
USER_ENV=".e"
USER_ALIAS_MENU=".ma"
USER_ENV_MENU=".me"
SET_ENV=.e

if [ -f "$USER_ENV" ];
then {
    echo "FILE $USER_ENV exists."
}
else {
    echo "FILE $USER_ALIASES Not Found."
    cp $startUpAliasFilesDir/.ue $USER_ENV
    chmod 766 $USER_ENV
}
fi

if [ -f "$USER_ALIASES" ];
then {
    echo "FILE $USER_ALIASES exists."
}
else {
    echo "FILE $USER_ALIASES Not Found."
    cp $startUpAliasFilesDir/.ua $USER_ALIASES
    chmod 766 $USER_ALIASES
}
fi

if [ -f "$USER_ALIAS_MENU" ];
then {
    echo "FILE $USER_ALIAS_MENU exists."
}
else {
    echo "FILE $USER_ALIAS_MENU Not Found."
    cp $startUpAliasFilesDir/.uma $USER_ALIAS_MENU
    chmod 766 $USER_ALIAS_MENU
}
fi

if [ -f "$USER_ENV_MENU" ];
then {
    echo "FILE $USER_ENV_MENU exists."
}
else {
    echo "FILE $USER_ENV_MENU Not Found."
    cp $startUpAliasFilesDir/.ume $USER_ENV_MENU
    chmod 766 $USER_ENV_MENU
}
fi

. $SET_ENV
