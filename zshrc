autoload -Uz compinit up-line-or-beginning-search down-line-or-beginning-search vcs_info
compinit

precmd() {
	vcs_info
  print -Pn "\e]0;%~\a"
}

function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    echo "%F{red}$LAST_EXIT_CODE%f"
  fi
}

zstyle ':completion:*' menu select
zstyle ':vcs_info:git*' formats "%F{yellow}%b%f "

setopt COMPLETE_ALIASES
setopt PROMPT_SUBST

PROMPT='%B--- %2~%b ${vcs_info_msg_0_}%B%F{cyan}»%f%b '
RPROMPT='$(check_last_exit_code)'

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

export ARCHFLAGS="-arch x86_64"
export EDITOR=nvim
export PIPENV_VENV_IN_PROJECT=1

alias mkdir="mkdir -pv"
alias ls="ls -aFGh --color=always"
alias rm="rm -rfv"
alias mv="mv -iv"
alias cp="cp -rv"
alias ix.io="curl -F 'f:1=<-' ix.io"
alias emacs="emacs -nw"
alias code="code-oss --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias vim="nvim"
