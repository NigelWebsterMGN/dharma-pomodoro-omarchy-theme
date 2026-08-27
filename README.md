# Dharma Pomodoro Omarchy Theme

Unofficial DHARMA Initiative inspired Omarchy theme pack by Nigel Webster [@nigelwebstermgn](https://github.com/nigelwebstermgn).

This repository contains the optional full desktop theme for the Dharma Pomodoro Omarchy plugin.

Version 1.0.0 is the first public V1 release. Suggestions and improvement ideas can be emailed to Nigel Webster at nigel.webster@mgnconsultancy.co.uk.

## What It Adds

- Dark and light DHARMA theme variants
- Station wallpapers for Main, Swan, Arrow, Staff, Pearl, Hydra, Flame, Orchid, Looking Glass, Tempest, Lamp Post, and Door
- Station-aware wallpaper switching when the Dharma Pomodoro plugin is installed
- DHARMA terminal preamble only while a DHARMA theme is active
- Screensaver branding that follows the selected station
- Theme-set hook that lets the plugin hide the clock when the user switches away from the DHARMA theme, if the plugin's Theme-bound clock option is enabled

## Install

From a clone of this repository:

```bash
./install.sh
omarchy restart shell
```

The Dharma Pomodoro plugin can also install this theme from its menu when the theme repository is public or the user has GitHub access.

## Plugin

The Omarchy marketplace plugin lives separately:

```text
https://github.com/nigelwebstermgn/dharma-pomodoro-omarchy-plugin
```

Install the plugin with:

```bash
omarchy plugin add https://github.com/nigelwebstermgn/dharma-pomodoro-omarchy-plugin.git --enable
```

## Remove

The Dharma Pomodoro plugin About panel includes a Remove Full Theme action. Without the plugin, remove the two installed theme folders manually:

```bash
mv ~/.config/omarchy/themes/dharma-swan-dark ~/.config/omarchy/themes/.dharma-swan-dark-removed
mv ~/.config/omarchy/themes/dharma-swan-light ~/.config/omarchy/themes/.dharma-swan-light-removed
```

Switch to another Omarchy theme before removing the active DHARMA theme.

## Notice

This is a fan-made theme pack. LOST, DHARMA Initiative, station names, and related marks belong to their respective owners.
