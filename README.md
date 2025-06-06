# dotfiles

This repo contains a collection of my dotfiles.

| basic                 | vim                 |
| --------------------- | ------------------- |
| ![main](src/main.png) | ![vim](src/vim.png) |

| terraform prompt                | go prompt         |
| ------------------------------- | ----------------- |
| ![terraform](src/terraform.png) | ![go](src/go.png) |

# Contents

- [dotfiles](#dotfiles)
- [Contents](#contents)
- [Contributing](#contributing)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Packages/Plugins](#packagesplugins)
  - [Fonts](#fonts)
  - [`ae`](#ae)
    - [pre-commit](#pre-commit)
- [Compatibilty](#compatibilty)

# Contributing

- Follow [conventional commits v1.0.0](https://www.conventionalcommits.org/en/v1.0.0/) for commits _and_ PR titles.
- Follow [GitHub Flow](https://githubflow.github.io) for branching strategy and PR process.

# Prerequisites

1. Xcode Command Line Tools: install with `xcode-select --install`
2. [VSCode](https://code.visualstudio.com/download) (optional)
   - `script/bootstrap` will copy settings if installed

# Installation

To install everything listed below, clone this repo and run `script/bootstrap`.

> [!NOTE]
> On Ubuntu, only a very minimal set of configuration takes place.

## Packages/Plugins

- [Homebrew](https://brew.sh)

- [act](https://nektosact.com)

- [asdf](https://asdf-vm.com)

- AWS

  - [awscli](https://aws.amazon.com/cli/)
  - [granted](https://docs.commonfate.io/granted/introduction)
  - [session-manager-plugin](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html)

- [checkov](https://www.checkov.io)

- [gcloud](https://cloud.google.com/cli)

- [gh](https://cli.github.com)

- [git-secret](https://sobolevn.me/git-secret/)

- [go](https://golang.org/)

- [jq](https://jqlang.github.io/jq/)

- [keychain](https://www.funtoo.org/Funtoo:Keychain)

- [node](https://nodejs.org)

- [opentofu](https://opentofu.org)

- [prettier](https://prettier.io)

- [pulumi](https://www.pulumi.com)

- [spacectl](https://docs.spacelift.io/concepts/spacectl)

- [terraform](https://terraform.io)

  - [terraform-docs](https://terraform-docs.io)
  - [tflint](https://github.com/terraform-linters/tflint)

- [vim](https://packages.ubuntu.com/bionic/vim)

  - [colorizer](https://github.com/lilydjwg/colorizer)
  - [NERDTree](https://github.com/scrooloose/nerdtree)
  - [pathogen](https://github.com/tpope/vim-pathogen)
  - [vim-surround](https://github.com/tpope/vim-surround)
  - [monokai-pro](https://github.com/phanviet/vim-monokai-pro)

- [Warp](https://www.warp.dev)

  - Settings will need manually adjusted - choose `Source Code Pro` as font and `Monokai Pro` as theme

- [zsh](https://packages.ubuntu.com/bionic/zsh)
  - [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
  - [starship](https://starship.rs)

## Fonts

- [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro)

## `ae`

> [!NOTE]
> Should be used by ehassett only and the directory is encrypted.

To install AE-specific components, navigate to [ae](ae/) and run the `script/bootstrap` located there.

### pre-commit

```
git-secret hide
git add .gitsecret
git add ae/**/*.secret
git add ae/**/.*.secret
```

# Compatibilty

- `script/bootstrap` has been tested on Mac and Ubuntu 24.04.
