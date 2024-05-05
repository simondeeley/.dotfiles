# Dotfiles

**A reproducable development environment.**

## Preamble

This repository was inspired by a number of videos and articles around managing dotfiles using a remote repo and discovering the benefits of using a (to me) new package manager - [Nix](https://nixos.org).

The always-there enticing prospect of a new laptop or computer brings with it the opportunity for me to always think "Can I do any better?" when I set things up. Can I create the _perfect_ development environment?

In this never-end quest for perfection, I stumbled upon [Nix](https://nixos.org), a cross-platform package manage that promises reproducable and reliable dependencies. If you want to learn more about what Nix does, particularly if you like deep-diving into _how_ something works then I highly recommend this article.

Nix offers a feature, combined with an add-on package `direnv`, that particularly excited me - `cd` into a directory on your machine and Nix creates a new shell evironment with all your dev dependencies loaded in, isolated from the rest of your system. No virtual machines, no Docker containers to spin up, just an isolated, and automated, build environment right where you need it.

## Prerequisites

In order to make the installation as easy as possible on a vanilla Linux or Mac system, the only requirement is being able to download and run the `install.sh` script from this repo.

```zsh
curl -sL https://raw.githubusercontent.com/simondeeley/.dotfiles/main/install.sh | zsh
```

## Installation

If you copied and pasted the above script into a posix-compatiable shell it should download and install all the necessary plugins and configurations necessary.

I use **Nix** as a package manager and **GNU Stow** to manage dotfiles. Stow creates symlinks to various config and dotfiles that are managed in this git repo.

I recommend you clone this repo and modify the config files to your own liking. You can add or remove plugins as you see fit too.
