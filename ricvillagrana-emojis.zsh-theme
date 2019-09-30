local ret_status="%(?:%{$fg_bold[green]%}●:%{$fg_bold[red]%}●) "

PROMPT='${ret_status}%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
RPS1='%B${return_code}%b'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}❯ %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}
%{$fg_bold[red]%}λ"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}
%{$fg_bold[green]%}λ"
