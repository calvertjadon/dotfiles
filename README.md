# dotfiles

This directory contains the dotfiles for my system

## Prerequisites

- GNUStow
- [Wezterm](https://wezterm.org/installation.html)
  - [CaskaydiaCove Nerd Font](https://www.nerdfonts.com/font-downloads)
- [ZSH](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
  - [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```sh
git clone git@github.com/calvertjadon/dotfiles.git
cd dotfiles
```

then run `stow x` where `x` is the package you want to configure

```sh
stow zsh
stow neovim
stow wezterm
```

