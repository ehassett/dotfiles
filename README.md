# dotfiles

My dotfiles configured with [chezmoi](https://www.chezmoi.io).

# Contents

- [dotfiles](#dotfiles)
- [Contents](#contents)
- [Contributing](#contributing)
- [Installation](#installation)
  - [Mac Workstation](#mac-workstation)
  - [Persistent Source](#persistent-source)
  - [One-shot](#one-shot)
  - [Other](#other)

# Contributing

- Follow [conventional commits v1.0.0](https://www.conventionalcommits.org/en/v1.0.0/) for commits _and_ PR titles.
- Follow [GitHub Flow](https://githubflow.github.io) for branching strategy and PR process.

# Installation

## Mac Workstation

Clones and keeps the full repo but replaces the binary with `brew`.

**Prerequisites:**

- `git`: can be installed the Xcode Command Line Tools - `xcode-select --install`

**Command:**

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --purge-binary --apply ehassett
```

## Persistent Source

Clones and keeps the full source.

**Prerequisites:**

- [Install](https://www.chezmoi.io/install/) chezmoi however you'd like.

**Command:**

```bash
chezmoi init --apply ehassett
```

## One-shot

Configures dotfiles then removes both the source and the tool.

**Command:**

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --one-shot --depth 1 --apply ehassett
```

## Other

For alternative install options and init flags, refer to the [chezmoi docs](https://www.chezmoi.io/install/).
