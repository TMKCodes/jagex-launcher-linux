#!/bin/sh
set -e

# if ! flatpak list | grep -q 'com.jagex.RuneScape'; then
#     echo "com.jagex.RuneScape is not installed. Installing..."
#     flatpak install com.jagex.RuneScape
# fi

# echo "Updating com.jagex.RuneScape..."
# flatpak update com.jagex.RuneScape

flatpak run --env=PULSE_LATENCY_MSEC=200 \
    --env='vblank_mode=0' \
    --env='MESA_GL_VERSION_OVERRIDE=4.5FC' \
    com.jagex.RuneScape || \
flatpak-spawn --host flatpak run \
    --env=PULSE_LATENCY_MSEC=200 \
    --env='vblank_mode=0' \
    --env='MESA_GL_VERSION_OVERRIDE=4.5FC' \
    --env=JX_ACCESS_TOKEN="$JX_ACCESS_TOKEN" \
    --env=JX_CHARACTER_ID="$JX_CHARACTER_ID" \
    --env=JX_DISPLAY_NAME="$JX_DISPLAY_NAME" \
    --env=JX_REFRESH_TOKEN="$JX_REFRESH_TOKEN" \
    --env=JX_SESSION_ID="$JX_SESSION_ID" \
    com.jagex.RuneScape
