# Ubuntu Niri Rice

Ported rice to my github with gpt because some people asked for it

## Theme flow

```text
wallpaper / light-dark mode
          |
          v
  DankMaterialShell session
          |
          v
 RiceMood accent extraction -> Matugen semantic palette
          |
          +-- Niri, GTK, Qt, Kitty and Ptyxis
          +-- Firefox and Vivaldi chrome
          +-- Obsidian and VS Code
          +-- Colloid icon family
          +-- shell prompt and DMS widgets
```

There is no polling loop. User-level systemd path units react only when the DMS
session or generated palette changes. VS Code stays dark while its important UI
and syntax accents follow the current wallpaper.

## What is included

- Active Niri configuration and generated DMS integration snippets
- DankMaterialShell settings and the Strongly Living Weekly bar widget
- RiceMood orchestration, Obsidian, Vivaldi, Firefox, and VS Code integration
- JetBrains Mono configuration for GTK, KDE/Qt, terminals, and fontconfig
- Event-driven user systemd units
- The current wallpaper library, including the paired light/dark wallpapers
- Firefox chrome CSS and a legacy Hyprland configuration for reference
- The reliable GRUB background/list configuration as a manual system snapshot
- Shell, Vim, GDB, and Git runtime configuration inherited from this repo's
  original purpose

Generated caches, browser databases, histories, credentials, backup copies,
and machine state are intentionally not tracked.

## Install

Review the files first. The installer backs up existing destinations rather
than deleting them.

```bash
./install.sh --dry-run
./install.sh
```

Use `--no-rice` to install only the terminal/runtime dotfiles, or `--no-omz`
to skip Oh My Zsh. The desktop portion expects Niri, DMS, Matugen, JetBrains
Mono, the Colloid icon theme, and the upstream RiceMood project. The
`ricemood` wrapper expects that project to be built at
`~/Projects/rice-tools/ricemood/dist/bin/ricemood.js`.

Firefox chrome files are installed into the first Snap Firefox `*.default*`
profile. Vivaldi integration targets the Snap package. Adjust those paths if a
native or Flatpak browser is used instead.

## Layout

```text
.config/                 active Niri, DMS, toolkit and systemd configuration
.local/bin/              palette generators and live application adapters
apps/firefox/            static Firefox chrome entrypoints
legacy/hyprland/         previous compositor setup
system/grub/             reference-only boot-menu snapshot
wallpapers/              the wallpaper library used by DMS
```

The files under `system/grub/` are deliberately not installed automatically.
Bootloader changes are hardware-specific and should be reviewed and copied
manually before running `update-grub`.

## Related project

The desktop widget opens the companion
[Strongly Living Weekly](https://github.com/notananotheralt/stronglylivingweekly)
application.
