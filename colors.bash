#!/bin/bash

CURRENT_SCHEME=$(gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null)

if [ "$CURRENT_SCHEME" = "'prefer-dark'" ]; then
    # --- Dark Mode (Grayscale) ---
    export THEME_BG_BASE="#0e0e0e"
    export THEME_BG_SURFACE="#111111"
    export THEME_FG_WHITE="#ffffff"
    export THEME_FG_LIGHT="#e5e5e5"
    export THEME_FG_MEDIUM="#a3a3a3"
    export THEME_FG_MUTED="#525252"

    export THEME_ZEN_BROWSER_DARK_BACKGROUND="${THEME_BG_BASE}"
else
    # --- Light Mode (Inverted Grayscale / Dawn) ---
    export THEME_BG_BASE="#faf4ed"
    export THEME_BG_SURFACE="#fffaf3"
    export THEME_FG_WHITE="#575279"
    export THEME_FG_LIGHT="#797593"
    export THEME_FG_MEDIUM="#9893a5"
    export THEME_FG_MUTED="#dfdad9"

    # Hardcoded color, got from zen auto-ai or some stuff transform to white theme
    export THEME_ZEN_BROWSER_DARK_BACKGROUND="#272727"
fi
