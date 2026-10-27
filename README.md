# Runtime Components

Personal Linux runtime configuration and an idempotent bootstrap script.

The RiceMood VS Code integration keeps VS Code dark while deriving its accent,
editor chrome, syntax, terminal, Git, and diagnostic colors from the current
DankMaterialShell wallpaper palette. A systemd path unit reacts to palette-file
changes, so it updates open VS Code windows without a polling process.

Run `./install.sh` to install everything, or `./install.sh --dry-run` to preview
the changes. Use `--no-vscode-theme` when DankMaterialShell/RiceMood is not part
of the target machine.
