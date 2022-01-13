set -o vi
export PS1="[\u@\h:\w ] $ "

startUpAliasFilesDir="/etc/profile.d/startUpAliasFiles/"

USER_ALIASES=".a"
USER_MENU=".m"

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

if [ -f "$USER_MENU" ];
then {
    echo "FILE $USER_MENU exists."
}
else {
    echo "FILE $USER_MENU Not Found."
    cp $startUpAliasFilesDir/.um $USER_MENU
    chmod 766 $USER_MENU
}
fi

. .a
. .m
