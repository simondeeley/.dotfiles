# Dotfiles

A repository for maintaining and tracking dotfiles on my system.

## Prerequisites

Ensure you have the following installed on your system

### Git

```
$ brew install git
```

### GNU Stow

```
$ brew install stow
```

## Installation

First, check-out this dotfiles repository into the home directory using git

```
$ git clone git@github.com/simondeeley/.dotfiles.git
$ cd dotfiles
```

Then use GNU Stow to create symlinks

```
$ stow .
```

## References

Original video: https://www.youtube.com/watch?v=y6XCebnB9gs
