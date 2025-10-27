#!/bin/bash

# Monitor Profile Switcher for Hyprland with nwg-displays
# Creates and swaps between different monitors.conf files

CONFIG_DIR="$HOME/.config/hypr"
MONITORS_CONF="$CONFIG_DIR/monitors.conf"

# Create profile configs if they don't exist
create_profiles() {
    # Laptop Only
    cat > "$CONFIG_DIR/monitors-laptop.conf" << EOF
# Laptop Only Profile
monitor=eDP-1,1920x1080@60.0,0x0,1.0
monitor=HDMI-A-1,disable
EOF

    # External Only
    cat > "$CONFIG_DIR/monitors-external.conf" << EOF
# External Monitor Only Profile
monitor=eDP-1,disable
monitor=HDMI-A-1,1920x1080@119.98,0x0,1.0
EOF

    # Extended (External Above) - Your current setup
    cat > "$CONFIG_DIR/monitors-extended.conf" << EOF
# Extended Display Profile (External Above Laptop)
monitor=eDP-1,1920x1080@60.0,0x1080,1.0
monitor=HDMI-A-1,1920x1080@119.98,0x0,1.0
EOF

    # Mirror Mode
    cat > "$CONFIG_DIR/monitors-mirror.conf" << EOF
# Mirror Display Profile
monitor=eDP-1,1920x1080@60.0,0x0,1.0
monitor=HDMI-A-1,1920x1080@119.98,0x0,1.0
EOF
}

# Create profiles on first run
if [ ! -f "$CONFIG_DIR/monitors-laptop.conf" ]; then
    create_profiles
fi

# Show menu with rofi
choice=$(echo -e "💻 Laptop Only\n🖥️  External Only\n📺 Extended (Current)\n🔄 Mirror" | rofi -dmenu -i -p "Display Mode")

case "$choice" in
    "💻 Laptop Only")
        cp "$CONFIG_DIR/monitors-laptop.conf" "$MONITORS_CONF"
        MODE="Laptop Only"
        ;;
    "🖥️  External Only")
        cp "$CONFIG_DIR/monitors-external.conf" "$MONITORS_CONF"
        MODE="External Only"
        ;;
    "📺 Extended (Current)")
        cp "$CONFIG_DIR/monitors-extended.conf" "$MONITORS_CONF"
        MODE="Extended Display"
        ;;
    "🔄 Mirror")
        cp "$CONFIG_DIR/monitors-mirror.conf" "$MONITORS_CONF"
        MODE="Mirrored"
        ;;
    *)
        exit 0
        ;;
esac

# Reload Hyprland config
hyprctl reload

# Restart waybar (optional)
killall waybar 2>/dev/null
waybar &

notify-send "Display Mode" "$MODE activated" -t 2000
