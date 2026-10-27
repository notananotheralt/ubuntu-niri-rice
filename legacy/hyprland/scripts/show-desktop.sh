#!/usr/bin/env bash

set -euo pipefail

workspace_id="$(hyprctl activeworkspace -j | jq -r '.id')"
state_file="${XDG_RUNTIME_DIR:-/tmp}/hypr-show-desktop-${workspace_id}"

# Pressing Super+D again restores the windows that were hidden.
if [[ -s "$state_file" ]]; then
    existing_clients="$(hyprctl clients -j)"
    commands=""

    while IFS= read -r address; do
        [[ -n "$address" ]] || continue

        # Ignore a window when it was closed while the desktop was shown.
        if jq -e --arg address "$address" \
            '.[] | select(.address == $address)' \
            <<< "$existing_clients" >/dev/null; then

            commands+="dispatch movetoworkspacesilent ${workspace_id},address:${address};"
        fi
    done < "$state_file"

    if [[ -n "$commands" ]]; then
        hyprctl --batch "$commands" >/dev/null
    fi

    rm -f "$state_file"
    exit 0
fi

# Collect ordinary windows on the active workspace.
# Pinned windows are deliberately left visible.
mapfile -t addresses < <(
    hyprctl clients -j |
        jq -r --argjson workspace_id "$workspace_id" '
            .[]
            | select(
                .workspace.id == $workspace_id
                and (.pinned | not)
            )
            | .address
        '
)

# Nothing to hide.
if (( ${#addresses[@]} == 0 )); then
    exit 0
fi

printf '%s\n' "${addresses[@]}" > "$state_file"

commands=""

for address in "${addresses[@]}"; do
    commands+="dispatch movetoworkspacesilent special:desktop,address:${address};"
done

hyprctl --batch "$commands" >/dev/null
