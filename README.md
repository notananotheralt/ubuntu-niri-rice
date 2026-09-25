# Runtime Components

Configuration files for CS 19300 Homework 5: Git Introduction.

- `.bashrc`: Bash history, prompt, aliases, and environment settings.
- `.zshrc`: Zsh settings and optional oh-my-zsh integration.
- `.vimrc`: Vim editing, indentation, and search settings.
- `.gdbinit`: GDB history and display settings.
- `.gitconfig`: Generic Git defaults and aliases, without personal identity information.
- `install.sh`: Installs the configuration files in your home directory.

Preview installation with `./install.sh --dry-run`. Run `./install.sh` to install,
or `./install.sh --no-omz` to skip oh-my-zsh installation. Existing shell/editor
configuration files are backed up. Git settings are included from
`~/.gitconfig.rc`, preserving your personal Git identity in `~/.gitconfig`.
