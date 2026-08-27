# DHARMA station terminal preamble.
[[ $- == *i* ]] || return
[[ ${TERM:-} != "dumb" ]] || return
current_theme="$(omarchy theme current 2>/dev/null || true)"
[[ "$current_theme" == Dharma\ Swan* ]] || return
[[ -n ${DHARMA_SWAN_LOGIN_SHOWN:-} ]] && return
export DHARMA_SWAN_LOGIN_SHOWN=1

station="SWAN"
config="$HOME/.config/omarchy/dharma/swan-timer.conf"
if [[ -r "$config" ]]; then
  station_line="$(grep -E '^STATION=' "$config" 2>/dev/null | tail -n 1)"
  station="${station_line#STATION=}"
  station="${station:-SWAN}"
fi
station_label="${station//_/ }"

printf '\033[38;2;231;216;138m'
cat <<SWAN

          _____________
      ___/             \___
    _/   DHARMA INITIATIVE  \_
   /   _____________________   \
  /   /  STATION: ${station_label}   \   \
 |   |                       |   |
 |   |        4 8 15         |   |
 |   |       16 23 42        |   |
  \   \_____________________/   /
   \_        NAMASTE          _/
     \___                 ___/
         \_______________/

SWAN
printf '\033[38;2;215;224;177m'
cat <<SWAN
${station_label} STATION LOGIN
ORIENTATION CHANNEL: 3
SYSTEM: ELECTROMAGNETIC CONTAINMENT MONITOR
STATUS: Awaiting code entry. Do not use for external communication.
NEXT PROTOCOL CYCLE: 108 minutes
AUTHORIZED SEQUENCE: 4 8 15 16 23 42

SWAN
printf '\033[0m'
