{ config, pkgs, ... }:

{
  home.file.".config/niri/config.kdl".text = ''
input {
    keyboard {
        xkb {
            layout "us,ru"
            options "grp:alt_shift_toggle"
        }
    }

    mouse {
        // off
        // natural-scroll
        // accel-speed 0.2
        // accel-profile "flat"
        // scroll-method "no-scroll"
    }
    focus-follows-mouse
}

output "DP-2" {
    mode "2560x1440@179.999"
    position x=0 y=0
}
output "HDMI-A-1" {
    mode "1280x1024@60.020"
    position x=2560 y=0
}

layout {
    gaps 5
    always-center-single-column true
    center-focused-column "never"
    preset-column-widths {
        proportion 0.33333
        proportion 0.5
        proportion 0.66667
    }

    default-column-width { proportion 0.5; }
    
    focus-ring {
        width 2
        // Colors can be set in a variety of ways:
        // - CSS named colors: "red"
        // - RGB hex: "#rgb", "#rgba", "#rrggbb", "#rrggbbaa"
        // - CSS-like notation: "rgb(255, 127, 0)", rgba(), hsl() and a few others.

        // Color of the ring on the active monitor.
        active-color "#c0caf5"

        // Color of the ring on inactive monitors.
        inactive-color "#505050"
    }
    
    border {
        off
        width 4
        active-color "#ffc87f"
        inactive-color "#505050"
        urgent-color "#9b0000"
    }

    shadow {
        softness 30
        spread 5
        offset x=0 y=5
        color "#0007"
    }

    struts {
        // left 64
        // right 64
        // top 64
        // bottom 64
    }
}

prefer-no-csd

//autorun
spawn-at-startup "/usr/libexec/polkit-mate-authentication-agent-1"
spawn-at-startup "swww-daemon"
spawn-at-startup "swww" "img" "/home/sanander/Pictures/Wallpaper/wallhaven-p9pd23.png"

hotkey-overlay {
    skip-at-startup
}

screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"


animations {
  slowdown 0.3
}

window-rule {
    match app-id="discord"                    

    open-on-output "HDMI-A-1"
    open-maximized true
}

window-rule {
    match app-id=r#"^org\.wezfurlong\.wezterm$"#
    default-column-width {}
}

window-rule {
    match app-id="steam" title=r#"^notificationtoasts_\d+_desktop$"#
    default-floating-position x=10 y=10 relative-to="bottom-right"
}

window-rule {
    match app-id=r#"firefox$"# title="^Picture-in-Picture$"
    open-floating true
}


/-window-rule {
    match app-id=r#"^org\.keepassxc\.KeePassXC$"#
    match app-id=r#"^org\.gnome\.World\.Secrets$"#

    block-out-from "screen-capture"
}

/-window-rule {
    geometry-corner-radius 12
    clip-to-geometry true
}

overview {
    backdrop-color "#282828"
    zoom 0.35
    // Catppuccin Mocha base
    // или
    // backdrop-color "rgba(17,17,27,0.85)"
}

binds {
    Mod+Shift+Slash { show-hotkey-overlay; }

    // Suggested binds for running programs: terminal, app launcher, screen locker.
    Mod+Q hotkey-overlay-title="Open a Terminal: alacritty" { spawn "alacritty"; }
    Mod+W hotkey-overlay-title="Run an Application: wofi" { spawn "wofi" "--show" "drun" "-I"; }

    Super+B {spawn "firefox"; }
    Super+E {spawn "nemo"; }
    Super+T {spawn "Telegram"; }


    Super+Alt+S allow-when-locked=true hotkey-overlay-title=null { spawn-sh "pkill orca || exec orca"; }

    XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0"; }
    XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"; }
    XF86AudioMute        allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
    XF86AudioMicMute     allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"; }

    XF86AudioPlay        allow-when-locked=true { spawn-sh "playerctl play-pause"; }
    XF86AudioStop        allow-when-locked=true { spawn-sh "playerctl stop"; }
    XF86AudioPrev        allow-when-locked=true { spawn-sh "playerctl previous"; }
    XF86AudioNext        allow-when-locked=true { spawn-sh "playerctl next"; }

    XF86MonBrightnessUp allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "+10%"; }
    XF86MonBrightnessDown allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "10%-"; }

    Mod+O repeat=false { toggle-overview; }

    Mod+C repeat=false { close-window; }

    Mod+Left  { focus-column-left; }
    Mod+Down  { focus-window-down; }
    Mod+Up    { focus-window-up; }
    Mod+Right { focus-column-right; }
    Mod+H     { focus-column-left; }
    Mod+J     { focus-window-down; }
    Mod+K     { focus-window-up; }
    Mod+L     { focus-column-right; }

    Mod+Ctrl+Left  { move-column-left; }
    Mod+Ctrl+Down  { move-window-down; }
    Mod+Ctrl+Up    { move-window-up; }
    Mod+Ctrl+Right { move-column-right; }
    Mod+Ctrl+H     { move-column-left; }
    Mod+Ctrl+J     { move-window-down; }
    Mod+Ctrl+K     { move-window-up; }
    Mod+Ctrl+L     { move-column-right; }

    Mod+Home { focus-column-first; }
    Mod+End  { focus-column-last; }
    Mod+Ctrl+Home { move-column-to-first; }
    Mod+Ctrl+End  { move-column-to-last; }

    Mod+Shift+Left  { focus-monitor-left; }
    Mod+Shift+Down  { focus-monitor-down; }
    Mod+Shift+Up    { focus-monitor-up; }
    Mod+Shift+Right { focus-monitor-right; }
    Mod+Shift+H     { focus-monitor-left; }
    Mod+Shift+J     { focus-monitor-down; }
    Mod+Shift+K     { focus-monitor-up; }
    Mod+Shift+L     { focus-monitor-right; }

    Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }
    Mod+Shift+Ctrl+Down  { move-column-to-monitor-down; }
    Mod+Shift+Ctrl+Up    { move-column-to-monitor-up; }
    Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
    Mod+Shift+Ctrl+H     { move-column-to-monitor-left; }
    Mod+Shift+Ctrl+J     { move-column-to-monitor-down; }
    Mod+Shift+Ctrl+K     { move-column-to-monitor-up; }
    Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }

    Mod+Page_Down      { focus-workspace-down; }
    Mod+Page_Up        { focus-workspace-up; }
    Mod+U              { focus-workspace-down; }
    Mod+I              { focus-workspace-up; }
    Mod+Ctrl+Page_Down { move-column-to-workspace-down; }
    Mod+Ctrl+Page_Up   { move-column-to-workspace-up; }
    Mod+Ctrl+U         { move-column-to-workspace-down; }
    Mod+Ctrl+I         { move-column-to-workspace-up; }

    Mod+Shift+Page_Down { move-workspace-down; }
    Mod+Shift+Page_Up   { move-workspace-up; }
    Mod+Shift+U         { move-workspace-down; }
    Mod+Shift+I         { move-workspace-up; }

    Mod+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
    Mod+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
    Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
    Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

    Mod+WheelScrollRight      { focus-column-right; }
    Mod+WheelScrollLeft       { focus-column-left; }
    Mod+Ctrl+WheelScrollRight { move-column-right; }
    Mod+Ctrl+WheelScrollLeft  { move-column-left; }

    Mod+Shift+WheelScrollDown      { focus-column-right; }
    Mod+Shift+WheelScrollUp        { focus-column-left; }
    Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
    Mod+Ctrl+Shift+WheelScrollUp   { move-column-left; }

    Mod+1 { focus-workspace 1; }
    Mod+2 { focus-workspace 2; }
    Mod+3 { focus-workspace 3; }
    Mod+4 { focus-workspace 4; }
    Mod+5 { focus-workspace 5; }
    Mod+6 { focus-workspace 6; }
    Mod+7 { focus-workspace 7; }
    Mod+8 { focus-workspace 8; }
    Mod+9 { focus-workspace 9; }
    Mod+Ctrl+1 { move-column-to-workspace 1; }
    Mod+Ctrl+2 { move-column-to-workspace 2; }
    Mod+Ctrl+3 { move-column-to-workspace 3; }
    Mod+Ctrl+4 { move-column-to-workspace 4; }
    Mod+Ctrl+5 { move-column-to-workspace 5; }
    Mod+Ctrl+6 { move-column-to-workspace 6; }
    Mod+Ctrl+7 { move-column-to-workspace 7; }
    Mod+Ctrl+8 { move-column-to-workspace 8; }
    Mod+Ctrl+9 { move-column-to-workspace 9; }

    Mod+F { maximize-column; }

    Mod+V       { toggle-window-floating; }
    Mod+Shift+V { switch-focus-between-floating-and-tiling; }

    Print { screenshot; }
    Ctrl+Print { screenshot-screen; }
    Alt+Print { screenshot-window; }
}
'';

}
