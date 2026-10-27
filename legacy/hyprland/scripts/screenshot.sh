#!/usr/bin/env bash

set -euo pipefail

mode="${1:-region}"
screenshot_dir="$HOME/Pictures/Screenshots"
timestamp="$(date +'%Y-%m-%d_%H-%M-%S')"
screenshot_file="$screenshot_dir/Screenshot_$timestamp.png"

mkdir -p "$screenshot_dir"

case "$mode" in
    region)
        # Let the user drag a rectangle. Cancel cleanly with Escape.
        geometry="$(slurp)" || exit 0
        [[ -n "$geometry" ]] || exit 0

        grim -g "$geometry" - |
            tee "$screenshot_file" |
            wl-copy --type image/png
        ;;

    full)
        # Capture the complete desktop.
        grim - |
            tee "$screenshot_file" |
            wl-copy --type image/png
        ;;

    *)
        printf 'Unknown screenshot mode: %s\n' "$mode" >&2
        exit 1
        ;;
esac
