#!/bin/zsh

# Install Nix package manager
if ! [ -x "$(command -v nix)" ]; then
    sh <(curl -L https://nixos.org/nix/install) --daemon
fi

# Source Nix in the shell
source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
source /nix/var/nix/profiles/default/etc/profile.d/nix.sh

# Install packages
nix-env -iA \
	nixpkgs.antidote \
	nixpkgs.git \
	nixpkgs.tmux \
	nixpkgs.fzf \
	nixpkgs.direnv

# stow dotfiles
stow git -t $HOME
stow zsh -t $HOME

# Add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# Use zsh as default shell
sudo chsh -s $(which zsh) $USER

# Antidote isn't source automatically, so we do it here
source $HOME/.nix-profile/share/antidote/antidote

# Load zsh plugins
antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
