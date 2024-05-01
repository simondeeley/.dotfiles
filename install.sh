#!/bin/zsh

# Install Nix package manager
if ! [ -x "$(command -v nix)" ]; then
    curl --proto '=https' --tlsv1.2 -sSf -L \
    https://install.determinate.systems/nix | sh -s -- install --no-confirm
fi

# Source Nix in the shell
source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
source /nix/var/nix/profiles/default/etc/profile.d/nix.sh

# Add Nix packages chanel and populate local list
nix-channel --add https://nixos.org/channels/nixos-23.11 nixpkgs && nix-channel --update

# Install packages
nix-env -iA \
	nixpkgs.antidote \
	nixpkgs.bat \
	nixpkgs.git \
	nixpkgs.tmux \
	nixpkgs.fzf \
	nixpkgs.direnv \
	nixpkgs.nix-direnv

# Clone this dotfiles repo to the home folder
if [ ! -d "$HOME/.dotfiles" ]; then
    git clone https://github.com/simondeeley/.dotfiles.git $HOME
fi

# stow dotfiles
stow git -d $HOME/.dotfiles -t $HOME
stow zsh -d $HOME/.dotfiles -t $HOME

# Add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# Use zsh as default shell
sudo chsh -s $(which zsh) $USER

# Antidote isn't sourced automatically, so we do it here
source $HOME/.nix-profile/share/antidote/antidote

# Load zsh plugins
antidote bundle < $HOME/.zsh_plugins.txt > $HOME/.zsh_plugins.sh

# Initialise direnv
#eval "$(direnv hook zsh)"

# Switch to ZSH
exec zsh
