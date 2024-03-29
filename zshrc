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

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory
setopt COMPLETE_ALIASES
setopt PROMPT_SUBST
setopt histignoredups

PROMPT='%B%F{154}---%f %2~%b ${vcs_info_msg_0_}%B%F{cyan}»%f%b '
RPROMPT='$(check_last_exit_code)'

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

wd() {
    . /usr/share/wd/wd.sh
}

bindkey -e
bindkey '\e[A' up-history
bindkey '\e[B' down-history
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

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
alias vim='nvim'
alias v='nvim'

[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi

