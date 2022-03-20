# Set the Environment
set -o vi
export PS1="[\u@\h:\w ] $ "
alias vma='vi ~/.env/.ma;ma'
alias vme='vi ~/.env/.me;me'
#----------------------------------------------
# Set the Aliases
#----------------------------------------------
. ~/.env/.a
#----------------------------------------------
# Setup .gitHub Environment
#----------------------------------------------
. ~/.env/setGitHubAccess
#----------------------------------------------
# Show the alias Command Menu
#----------------------------------------------
. ~/.env/.ma
