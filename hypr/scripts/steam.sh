#!/bin/bash

CACHE="$HOME/.cache/steam-games"

get_libraries() {
    grep -oP '"path"\s+"\K[^"]+' \
        "$HOME/.local/share/Steam/steamapps/libraryfolders.vdf"
}

rebuild_cache() {
    mkdir -p "$(dirname "$CACHE")"

    while read -r library; do
        steamapps="$library/steamapps"

        [ -d "$steamapps" ] || continue

        find "$steamapps" -maxdepth 1 -name 'appmanifest_*.acf' |
        while read -r file; do

            # skip invalid/missing installs (fixes ghost entries)
            install_dir=$(grep -m1 '"installdir"' "$file" | sed -E 's/.*"installdir"[[:space:]]+"(.*)"/\1/')
            appdir="$steamapps/common/$install_dir"
            [ -d "$appdir" ] || continue

            appid=$(grep -m1 '"appid"' "$file" | grep -oP '\d+')
            name=$(grep -m1 '"name"' "$file" | sed -E 's/.*"name"[[:space:]]+"(.*)"/\1/')

            printf "%s|%s\n" "$appid" "$name"

        done
    done < <(get_libraries) | sort -t'|' -k2,2 -u > "$CACHE"
}

if [ "$1" = "--refresh" ]; then
    rebuild_cache
    exit 0
fi

[ -f "$CACHE" ] || rebuild_cache

selected=$(
    cut -d'|' -f2 "$CACHE" |
    rofi -dmenu -i -p "Launch"
)

[ -n "$selected" ] || exit 0

appid=$(
    awk -F'|' -v game="$selected" '$2 == game { print $1; exit }' "$CACHE"
)

[ -n "$appid" ] || exit 1

steam -silent "steam://rungameid/$appid"
