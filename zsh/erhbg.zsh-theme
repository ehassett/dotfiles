# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: http://bbs.archlinux.org/viewtopic.php?pid=521888#p521888
PROMPT=$'%{\e[1;91m%}%B┌─[%b%{\e[1;33m%}%~%{\e[1;91m%}%B]%b%{\e[1;91m%} - %{\e[1;91m%}%B[%b%{\e[1;33m%}'%D{"%a %b %d, %H:%M"}%b$'%{\e[1;91m%}%B]%b%{\e[0m%}
%{\e[1;91m%}%B└─%B[%{\e[1;33m%}$%{\e[1;91m%}%B] <%{\e[0;36m%}$(git_prompt_info)%{\e[1;91m%}>%{\e[0m%}%b '
PS2=$' \e[1;91m%}%B>%{\e[0m%}%b '

ZSH_THEME_GIT_PROMPT_PREFIX='git:('
ZSH_THEME_GIT_PROMPT_SUFFIX=')'
ZSH_THEME_GIT_PROMPT_DIRTY=' +'
ZSH_THEME_GIT_PROMPT_CLEAN=''
