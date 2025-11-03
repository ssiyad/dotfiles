alias mkdir="mkdir -pv"
alias ls="ls -aFGh --color=always"
alias rm="rm -rfv"
alias mv="mv -iv"
alias cp="cp -rv"

abbr v "nvim"
abbr g "git"

set fish_greeting
set -x EDITOR nvim

function ts
	set session_name (basename (pwd))
	if set -q TMUX
		echo 'Already inside a tmux session'
		exit 1
	else if tmux has-session -t $session_name
		tmux attach-session -t $session_name
	else
		tmux new-session -s $session_name
	end
end
