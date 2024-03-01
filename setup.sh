#!/usr/bin/env bash

# install nodejs repo
if ! command -v npm >/dev/null 2>&1; then
	curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash -
fi

# install other deps
# name,cmd
required=("ripgrep,rg" "fzf,fzf" "git,git" "stow,stow" "fd-find,fd" "npm,npm")
missing=()

for i in "${required[@]}"; do
	name=${i%,*}
	cmd=${i#*,}

	if ! command -v "$cmd" >/dev/null 2>&1; then
		echo "$name is missing"
		missing+=("$cmd")
	fi
done

if [ ${#missing[@]} -gt 0 ]; then
	echo "Installing missing dependencies:" "${missing[@]}"
	sudo apt install -y "${missing[@]}"
fi


git submodule init
git submodule update

stow .

# configure tmux
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    tmux source "$HOME/.config/tmux/tmux.conf"
    "$HOME/.config/tmux/plugins/tpm/bin/install_plugins"

    chmod u+x "$HOME/.config/tmux/plugins/tmux-kanagawa/kanagawa.tmux"
    fd .*\.sh "$HOME/.config/tmux/plugins/tmux-kanagawa/scripts" --exec chmod u+x {} \;
fi

# configure aliases
case "$HOSTNAME" in
"L1IT-LP01") ;;
*) ;;
esac

echo 'alias ll="ls -al"' >~/.bash_aliases

source "$HOME/.bashrc"
echo "Setup successful."
