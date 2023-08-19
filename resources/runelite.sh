#!/bin/sh
set -e

if ! flatpak list | grep -q 'net.runelite.RuneLite'; then
    echo "net.runelite.RuneLite is not installed. Installing..."
    flatpak install net.runelite.RuneLite
fi

echo "Updating net.runelite.RuneLite..."
flatpak update net.runelite.RuneLite

echo "Running net.runelite.RuneLite..."
flatpak run net.runelite.RuneLite \
    --env=JX_ACCESS_TOKEN="$JX_ACCESS_TOKEN" \
    --env=JX_CHARACTER_ID="$JX_CHARACTER_ID" \
    --env=JX_DISPLAY_NAME="$JX_DISPLAY_NAME" \
    --env=JX_REFRESH_TOKEN="$JX_REFRESH_TOKEN" \
    --env=JX_SESSION_ID="$JX_SESSION_ID"