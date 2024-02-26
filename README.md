# dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```bash
sudo apt install git
```

### Stow

```bash
sudo apt install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/calvertjadon/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

## References

[Dreams of Anatomy YouTube video](https://www.youtube.com/watch?v=y6XCebnB9gs)

- [repo](https://github.com/dreamsofautonomy/dotfiles)
