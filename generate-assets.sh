#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
theme="$root/theme"
theme_light="$root/theme-light"
mkdir -p "$theme/backgrounds" "$theme_light/backgrounds"

cat > "$theme/dharma-swan-logo.svg" <<'SVG'
<svg xmlns="http://www.w3.org/2000/svg" width="1024" height="1024" viewBox="0 0 1024 1024">
  <g transform="translate(512 512)">
    <polygon points="0,-470 332,-332 470,0 332,332 0,470 -332,332 -470,0 -332,-332" fill="none" stroke="#050505" stroke-width="30"/>
    <circle r="260" fill="#050505"/>
    <rect x="-310" y="-68" width="620" height="136" fill="#050505"/>
    <text x="0" y="34" text-anchor="middle" font-family="Arial Black, Helvetica, sans-serif" font-size="82" fill="#ffffff" letter-spacing="10">DHARMA</text>
    <g fill="#050505">
      <rect x="-42" y="-420" width="84" height="20"/><rect x="-42" y="-388" width="84" height="20"/><rect x="-42" y="-356" width="84" height="20"/>
      <rect x="-42" y="336" width="84" height="20"/><rect x="-42" y="368" width="84" height="20"/><rect x="-42" y="400" width="84" height="20"/>
      <rect x="-420" y="-42" width="84" height="20"/><rect x="-420" y="-10" width="84" height="20"/><rect x="-420" y="22" width="84" height="20"/>
      <rect x="336" y="-42" width="84" height="20"/><rect x="336" y="-10" width="84" height="20"/><rect x="336" y="22" width="84" height="20"/>
    </g>
    <g fill="#050505" transform="rotate(45)">
      <rect x="-42" y="-420" width="84" height="20"/><rect x="-42" y="-388" width="84" height="20"/><rect x="-42" y="-356" width="84" height="20"/>
      <rect x="-42" y="336" width="84" height="20"/><rect x="-42" y="368" width="84" height="20"/><rect x="-42" y="400" width="84" height="20"/>
      <rect x="-420" y="-42" width="84" height="20"/><rect x="-420" y="-10" width="84" height="20"/><rect x="-420" y="22" width="84" height="20"/>
      <rect x="336" y="-42" width="84" height="20"/><rect x="336" y="-10" width="84" height="20"/><rect x="336" y="22" width="84" height="20"/>
    </g>
    <g transform="translate(-18 -130) scale(0.72)" fill="#ffffff">
      <path d="M-70 70 C-30 15 10 -8 65 -14 C126 -20 169 7 193 48 C145 48 110 55 79 75 C46 97 16 109 -31 109 C-62 109 -84 99 -99 82 C-90 82 -80 78 -70 70Z"/>
      <path d="M-2 -1 C19 -61 58 -112 120 -145 C134 -152 153 -151 166 -141 C123 -124 94 -89 81 -48 C71 -16 73 13 92 44 L55 54 C26 33 7 16 -2 -1Z"/>
      <path d="M154 -149 C181 -156 210 -149 232 -128 C205 -125 184 -118 166 -102 C160 -119 156 -135 154 -149Z"/>
      <path d="M-118 86 C-159 85 -190 74 -218 49 C-179 51 -151 42 -122 21 C-128 41 -126 65 -118 86Z"/>
    </g>
  </g>
</svg>
SVG

convert -background none "$theme/dharma-swan-logo.svg" "$theme/dharma-swan-logo.png"
convert "$theme/dharma-swan-logo.png" -channel RGB -negate "$theme/dharma-swan-logo-white.png"
cp "$theme/dharma-swan-logo.svg" "$theme_light/dharma-swan-logo.svg"
cp "$theme/dharma-swan-logo.png" "$theme_light/dharma-swan-logo.png"

convert -size 2560x1440 xc:'#000000' \
  \( "$theme/dharma-swan-logo-white.png" -resize 760x760 \) -gravity center -geometry +0-40 -compose over -composite \
  -fill '#ffffff' -font iA-Writer-Mono-S-Regular -pointsize 44 -gravity south -annotate +0+176 'STATION 3 : THE SWAN' \
  -fill '#ffffff' -pointsize 28 -annotate +0+120 'PROTOCOL ACTIVE    4 8 15 16 23 42    108 MINUTES' \
  "$theme/backgrounds/01-swan-station.png"

convert -size 2560x1440 xc:'#000000' \
  \( "$theme/dharma-swan-logo-white.png" -resize 420x420 \) -gravity center -geometry +0-160 -compose over -composite \
  -fill '#ffffff' -font iA-Writer-Mono-S-Regular -pointsize 56 -gravity center -annotate +0+160 'DHARMA INITIATIVE' \
  -fill '#ffffff' -pointsize 34 -annotate +0+230 'SWAN STATION ACCESS' \
  -fill '#ffffff' -pointsize 26 -annotate +0+290 'ENTER AUTHORIZATION CODE' \
  "$theme/unlock.png"

cp "$theme/unlock.png" "$theme/preview-unlock.png"
cp "$theme/backgrounds/01-swan-station.png" "$theme/preview.png"

convert -size 2560x1440 xc:'#ffffff' \
  \( "$theme/dharma-swan-logo.png" -resize 760x760 \) -gravity center -geometry +0-40 -compose over -composite \
  -fill '#000000' -font iA-Writer-Mono-S-Regular -pointsize 44 -gravity south -annotate +0+176 'STATION 3 : THE SWAN' \
  -fill '#000000' -pointsize 28 -annotate +0+120 'PROTOCOL ACTIVE    4 8 15 16 23 42    108 MINUTES' \
  "$theme_light/backgrounds/01-swan-station.png"

convert -size 2560x1440 xc:'#ffffff' \
  \( "$theme/dharma-swan-logo.png" -resize 420x420 \) -gravity center -geometry +0-160 -compose over -composite \
  -fill '#000000' -font iA-Writer-Mono-S-Regular -pointsize 56 -gravity center -annotate +0+160 'DHARMA INITIATIVE' \
  -fill '#000000' -pointsize 34 -annotate +0+230 'SWAN STATION ACCESS' \
  -fill '#000000' -pointsize 26 -annotate +0+290 'ENTER AUTHORIZATION CODE' \
  "$theme_light/unlock.png"

cp "$theme_light/unlock.png" "$theme_light/preview-unlock.png"
cp "$theme_light/backgrounds/01-swan-station.png" "$theme_light/preview.png"
for file in icons.theme keyboard.rgb neovim.lua; do
  cp "$theme/$file" "$theme_light/$file"
done
