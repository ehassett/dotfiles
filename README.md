# Ethan's dotfiles

This repo contains a collection of my dotfiles. Suggestions and contributions are welcome!

# Screenshot
![image](https://user-images.githubusercontent.com/7284853/83916828-d9fb6480-a743-11ea-90db-f4ef9f0c8945.png)
Windows Terminal

# Installation

To install all the packages and plugins listed below, clone this repo and run `script/bootstrap`.

## Packages/Plugins

* [docker](https://www.docker.com/) (See notes below)

* [git-secret](https://git-secret.io/)

* [keychain](https://packages.ubuntu.com/bionic/keychain)

* [ruby](https://www.ruby-lang.org)

* [terraform](https://www.terraform.io)

* [tmux](https://packages.ubuntu.com/bionic/tmux)
  * [tmuxinator](https://github.com/tmuxinator/tmuxinator)

* [vim](https://packages.ubuntu.com/bionic/vim)
  * [colorizer](https://github.com/lilydjwg/colorizer)
  * [NERDTree](https://github.com/scrooloose/nerdtree)
  * [pathogen](https://github.com/tpope/vim-pathogen)
  * [vim-surround](https://github.com/tpope/vim-surround)

* [Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701) (See notes below)
  * [settings.json](wsl/winterm/settings.json)

* [zsh](https://packages.ubuntu.com/bionic/zsh)
  * [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

# Compatibilty
Tested on Ubuntu 18.04 and Ubuntu 18.04, 19.10, 20.04 for WSL.

# Notes
## Docker
After installing docker, you may need to follow [these instructions](https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user) to allow non-root users to manage docker.

## Windows Terminal
`script/bootstrap` does not install Windows Terminal or copy `settings.json`. This is due to the settings file using GUIDs for WSL distributions, PowerShell, cmd, etc.
Instead, if you would like to use my configuration, copy the contents `settings.json` into your current Windows Terminal settings file, first changing the GUIDs to the proper ones.
