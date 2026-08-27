#!/usr/bin/env bash
set -euo pipefail

src="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
stamp="$(date +%Y%m%d%H%M%S)"
theme_dest="$HOME/.config/omarchy/themes/dharma-swan-dark"
light_theme_dest="$HOME/.config/omarchy/themes/dharma-swan-light"
plugin_control="$HOME/.config/omarchy/plugins/nigelwebstermgn.dharma-pomodoro/shell/dharma-pomodoro-control"

backup_file() {
  local path="$1"
  if [[ -e "$path" && ! -e "$path.bak.$stamp" ]]; then
    cp -a "$path" "$path.bak.$stamp"
  fi
}

if command -v magick >/dev/null 2>&1; then
  python3 "$src/generate-station-backgrounds.py"
fi

mkdir -p "$HOME/.config/omarchy/themes" "$HOME/.config/omarchy/branding" "$HOME/.config/omarchy/dharma"

rm -rf "$theme_dest"
cp -a "$src/theme" "$theme_dest"
rm -rf "$light_theme_dest"
cp -a "$src/theme-light" "$light_theme_dest"

backup_file "$HOME/.config/omarchy/branding/screensaver.txt"
backup_file "$HOME/.config/omarchy/branding/about.txt"
install -m 0644 "$src/branding/screensaver.txt" "$HOME/.config/omarchy/branding/screensaver.txt"
install -m 0644 "$src/branding/about.txt" "$HOME/.config/omarchy/branding/about.txt"
install -m 0644 "$src/shell/swan-login.sh" "$HOME/.config/omarchy/dharma/swan-login.sh"

backup_file "$HOME/.bashrc"
if ! grep -Fq '. "$HOME/.config/omarchy/dharma/swan-login.sh"' "$HOME/.bashrc"; then
  printf '\n# DHARMA station terminal greeting\n[[ -r "$HOME/.config/omarchy/dharma/swan-login.sh" ]] && . "$HOME/.config/omarchy/dharma/swan-login.sh"\n' >> "$HOME/.bashrc"
fi

backup_file "$HOME/.config/starship.toml"
install -m 0644 "$src/starship.toml" "$HOME/.config/starship.toml"

mkdir -p "$HOME/.config/omarchy/hooks/theme-set.d"
install -m 0755 "$src/shell/dharma-theme-set-hook" "$HOME/.config/omarchy/hooks/theme-set.d/dharma-station-background"

omarchy theme set "dharma-swan-dark"
if [[ -x "$plugin_control" ]]; then
  "$plugin_control" apply-station >/dev/null 2>&1 || true
fi

echo "Installed Dharma Pomodoro Omarchy theme."
