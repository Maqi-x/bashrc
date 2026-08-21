# bashrc
This repository contains my personal bash configuration. It includes aliases, functions, and environment variable settings that I use on my system. The configuration is split into separate files for easier organization and customization. You can modify or extend it as needed.
**designed for Linux**; tested on **Arch Linux** (primary) and **ZorinOS** (secondary)

## Installation
just run
```sh
./install.sh
```

This will:

* copy files to `~/configuration/bashrc`
* backup existing `~/.bashrc` (if needed)
* create a symlink to the new config

## Integrations
### Optional
`starship`, `zoxide`, `bat`, `pyenv`, `ccache`, `bc`

**on arch:** `pkgfile` and `yay`

**on ubuntu:** `apt-file`

### Required (kind of)
`nvim`, `git`, `bash` (wow!)

### Installing dependencies
#### Arch Linux
`sudo pacman -S neovim git bash starship zoxide bat pyenv ccache pkgfile bc`

#### Debian/Ubuntu
`sudo apt install zoxide bat ccache neovim git bash apt-file bc`
`curl -sS https://starship.rs/install.sh | sh`
`curl -fsSL https://pyenv.run | bash`

## Notes
- You may need to adjust paths, environment variables, or aliases for your system.
- Review the files before installing to ensure compatibility.
