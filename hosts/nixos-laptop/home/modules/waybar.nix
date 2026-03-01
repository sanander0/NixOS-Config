{ config, pkgs, ... }:

{
  home.file.".config/waybar/config.jsonc".text = ''
[
  {
    // MAIN BAR //
    "layer": "top",
    "position": "top",
    "name": "main",
    "reload_style_on_change": true,

    "margin-top": 3,
    "margin-left": 3,
    "margin-right": 3,

    "modules-left": [
      "custom/logo",
      "river/tags",
    ],

    "modules-right": [
      "group/traym",
      "custom/spacer1",
      "cpu",
      "memory#ram",
      "temperature",
      "network#info",
      "custom/spacer2",
      "pulseaudio#output",
      "custom/spacer3",
      "battery",
      "custom/spacer4",
      "clock",
    ],

    // Modules
    "temperature": {
      "interval": 10,
      "hwmon-path": "/sys/devices/platform/coretemp.0/hwmon/hwmon4/temp1_input",
      "critical-threshold": 100,
      "format-critical": "<span foreground='#f38ba8'></span> {temperatureC}°C",
      "format": "<span foreground='#a6e3a1'></span> {temperatureC}°C"
    },

    "battery": {
      "states": {
        "good": 95,
        "warning": 30,
        "critical": 20
        },
      "format": "<span foreground='#a6e3a1'>{icon}</span> {capacity}%",
      "format-charging": "<span foreground='#94e2d5'> </span> {capacity}%",
      "format-plugged": "<span foreground='#94e2d5'> </span> {capacity}%",
      "format-alt": "{time} <span foreground='#a6e3a1'>{icon}</span>",
      "format-icons": [" ", " ", " ", " ", " "]
    },

    "group/traym": {
      "orientation": "horizontal",
      "modules": ["custom/trayicon", "tray"],
    },

    "custom/logo": {
      "format": "<span foreground='#fab387'> </span>",
      "tooltip": true,
      "on-click": "pgrep -x wofi && pkill wofi || wofi --show drun -I"
    },
    
    "clock": {
      "interval": 1,
      "format": " {:%H:%M:%S    %a %d.%m}",
      "tooltip-format": "{calendar}",
      "calendar": {
        "weeks-pos": "right",
        "mode": "month",
        "format": {
          "months": "<span color='#cba6f7'><b>{}</b></span>",
          "days": "<span color='#cdd6f4'><b>{}</b></span>",
          "weeks": "<span color='#94e2d5'> W{}</span>",
          "weekdays": "<span color='#f9e2af'><b>{}</b></span>",
          "today": "<span color='#f5e0dc'><b><u>{}</u></b></span>",
        },
      },
    },

    "cpu": {
      "interval": 4,
      "min-length": 6,
      "format": "<span foreground='#a6e3a1'></span> {usage}%",
      "states": {
        "warning": 80,
        "critical": 95,
      },
    },

    "memory#ram": {
      "interval": 4,
      "format": "<span foreground='#a6e3a1'>󰍛</span> {percentage}%",
      "states": {
        "warning": 80,
        "critical": 95,
      },
      "tooltip": "{}",
      "tooltip-format": "{used}/{total} GiB",
    },

    "network#info": {
      "interval": 2,
      "format": "<span foreground='#eba0ac'>󰌙</span> Offline",
      "format-wifi": "<span foreground='#a6e3a1'>{icon}</span> {bandwidthDownBits}",
      "format-ethernet": "<span foreground='#89b4fa'>󰈀</span> {bandwidthDownBits}",
      "min-length": 11,
      "tooltip": "{}",
      "tooltip-format-wifi": "{ifname}\n{essid}\n{signalStrength}% \n{frequency} GHz\n󰇚 {bandwidthDownBits}\n󰕒 {bandwidthUpBits}",
      "tooltip-format-ethernet": "{ifname}\n󰇚 {bandwidthDownBits} \n󰕒 {bandwidthUpBits}",
      "format-icons": ["󰤫", "󰤟", "󰤢", "󰤥", "󰤨"],
      "states": {
        "normal": 25,
      },
    },

    "network#up": {
      "interval": 4,
      "format": " ",
      "format-wifi": "󰕒 {bandwidthUpBits}",
      "format-ethernet": "󰕒 {bandwidthUpBits}",
      "format-disconnected": " ",
      "min-length": 11,
    },

    "network#down": {
      "interval": 4,
      "format": "󰇚 {bandwidthDownBits}",
      "format-wifi": "󰇚 {bandwidthDownBits}",
      "format-ethernet": "󰇚 {bandwidthDownBits}",
      "min-length": 11,
    },

    "river/tags": {
      "disable-scroll-wraparound": true,
      "hide-vacant": true,
      "smooth-scrolling-threshold": 4,
      "enable-bar-scroll": true,
      "format": "{icon}",
      "show-special": true,
      "special-visible-only": false,
      "format-icons": {
        "magic": "",
        "zellij": "",
        "10": "󰊴",
        "lock": "",
      },
    },

    "pulseaudio#output": {
      "format": "{icon} {volume}%",
      "format-bluetooth": "{icon} {volume}%",
      "format-source-muted": "{volume}",
      "format-icons": {
        "headphone": "",
        "hands-free": "",
        "headset": "",
        "phone": "",
        "portable": "",
        "car": "",
        "default": [" ", " "],
      },
      "on-click": "pactl set-sink-mute @DEFAULT_SINK@ toggle",
      "on-click-right": "pwvucontrol & aplay ~/.config/sounds/interact.wav",
      "on-scroll-up": "sh -c 'vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP \"\\d+(?=%)\" | head -1); if [ \"$vol\" -lt 100 ]; then pactl set-sink-volume @DEFAULT_SINK@ +2%; else pactl set-sink-volume @DEFAULT_SINK@ 110%; fi'",
      "on-scroll-down": "pactl set-sink-volume @DEFAULT_SINK@ -2%",
      "tooltip": true,
      "scroll-step": 4,
    },

    "tray": {
      "icon-size": 18,
      "spacing": 8,
    },

    "custom/spacer": {
      "format": " ",
      "tooltip": false,
    },

    "custom/spacer1": {
      "format": "",
      "tooltip": false,
    },

    "custom/spacer2": {
      "format": "",
      "tooltip": false,
    },

    "custom/spacer3": {
      "format": "",
      "tooltip": false,
    },

    "custom/spacer4": {
      "format": "",
      "tooltip": false,
    },

    "custom/spacer5": {
      "format": "",
      "tooltip": false,
    },

    "custom/spacer6": {
      "format": "",
      "tooltip": false,
    },
  },
]
  '';

  home.file.".config/waybar/style.css".text = ''
/* vim:fileencoding=utf-8:foldmethod=marker:ft=css
*/

/* 🎨 Catppuccin Mocha Colors */
/* {{{ */
@define-color rosewater  #f5e0dc;
@define-color flamingo   #f2cdcd;
@define-color pink       #f5c2e7;
@define-color mauve      #cba6f7;
@define-color red        #f38ba8;
@define-color maroon     #eba0ac;
@define-color peach      #fab387;
@define-color yellow     #f9e2af;
@define-color green      #a6e3a1;
@define-color teal       #94e2d5;
@define-color sky        #89dceb;
@define-color sapphire   #74c7ec;
@define-color blue       #89b4fa;
@define-color lavender   #b4befe;
@define-color text       #cdd6f4;
@define-color subtext1   #bac2de;
@define-color subtext0   #a6adc8;
@define-color overlay2   #9399b2;
@define-color overlay1   #7f849c;
@define-color overlay0   #6c7086;
@define-color surface2   #585b70;
@define-color surface1   #45475a;
@define-color surface0   #313244;
@define-color base       #1e1e2e;
@define-color mantle     #181825;
@define-color crust      #11111b;

/* Semantic aliases for your existing variable names */
@define-color background1    @surface0;
@define-color background2    @mantle;
@define-color separator      @surface1;
@define-color warning        @peach;
@define-color caution        @maroon;
@define-color performance    @green;
@define-color audio          @mauve;
@define-color misc           @teal;
@define-color date           @yellow;
@define-color work           @blue;
@define-color window         @blue;
@define-color resize         @peach;
@define-color process        @peach;
@define-color text-primary   @text;
/* }}} */

/* Reset all styles */
/* {{{ */
* {
  border: none;
  border-radius: 0;
  min-height: 0;
  margin: 0;
  padding: 0;
  box-shadow: none;
  text-shadow: none;
}
/* }}} */

/* Main bar keyframes */
/* {{{ */
@keyframes blink-urgent-workspace {
  to { color: @warning; }
}

@keyframes blink-critical-text {
  to { color: @surface1; }
}

@keyframes blink-modifier-text {
  to { color: @surface1; }
}

@keyframes blink-special-workspace {
  to { color: @window; }
}
/* }}} */

/* Main bar defaults */
/* {{{ */
#waybar.main {
  background: @background2;
  font-family: "JetBrainsMono Nerd Font propo";
  font-size: 12pt;
  font-weight: 600;
  color: @text-primary;
  border-radius: 0pt;
}

#waybar.main button {
  font-family: "JetBrains Mono Nerd Font propo";
  font-size: 12pt;
  font-weight: 600;
  color: @text-primary;
}
/* }}} */

/* Main bar modules padding */
/* {{{ */
#waybar.main #network,
#waybar.main #battery,
#waybar.main #clock,
#waybar.main #cpu,
#waybar.main #memory.ram,
#waybar.main #pulseaudio,
#waybar.main #temperature,
#waybar.main #traym,
#waybar.main #window {
  padding-left: 8pt;
  padding-right: 8pt;
}
/* }}} */

/* Module colors */
/* {{{ */
#waybar.main #cpu,
#waybar.main #temperature,
#waybar.main #memory.ram,
#waybar.main #network {
  color: @performance;
  background: @background1;
}

#waybar.main #pulseaudio {
  color: @audio;
  background: @background2;
}

#waybar.main #battery {
  color: @misc;
  background: @background1;
}

#waybar.main #clock,
#custom-timer {
  color: @date;
  background: @background2;
}

#waybar.main #clock {
  border-radius: 0pt 6pt 6pt 0pt;
}

#waybar.main #network.info {
  padding-right: 10px;
  padding-left: 10px;
  color: @caution;
}

#waybar.main #network.info.wifi.normal,
#waybar.main #network.info.ethernet {
  color: @performance;
  padding-right: 15px;
}

#waybar.main #network.info.wifi {
  color: @warning;
  padding-right: 15px;
}
/* }}} */

/* Main bar criticals */
/* {{{ */
#waybar.main #memory.swap.critical,
#waybar.main #memory.ram.critical,
#waybar.main #cpu.critical,
#waybar.main #temperature.critical {
  color: @warning;
  animation-iteration-count: infinite;
  animation-direction: alternate;
  animation-name: blink-critical-text;
  animation-duration: 1s;
  animation-timing-function: steps(15);
}

#waybar.main #tags button.urgent,
#waybar.main #tags button.special.urgent {
  transition: all 0s ease;
  background-image: linear-gradient(
    -63.435deg,
    transparent 25%,
    @background2 25%,
    @background2 75%,
    transparent 75%
  );
  animation-iteration-count: infinite;
  animation-direction: alternate;
  animation-name: blink-urgent-workspace;
  animation-duration: 1s;
  animation-timing-function: steps(15);
}
/* }}} */

/* Main bar warnings */
/* {{{ */
#waybar.main #custom-headsetbattery.off,
#waybar.main #pulseaudio.output.muted,
#waybar.main #pulseaudio.input.source-muted {
  color: @surface1;
}
#waybar.main #custom-headsetbattery.low,
#waybar.main #custom-battery.warning,
#waybar.main #custom-battery.critical {
  color: @warning;
}
/* }}} */

/* Battery charging */
/* {{{ */
#waybar.main #custom-battery.charging {
  color: @misc;
  animation-iteration-count: infinite;
  animation-direction: alternate;
  animation-name: blink-modifier-text;
  animation-duration: 1s;
  animation-timing-function: steps(15);
}
/* }}} */

/* Workspaces */
/* {{{ */
#waybar.main #tags {
  padding-left: 20px;
  padding-right: 4px;
  margin-top: -6px;
  margin-bottom: -6px;
  background-image: linear-gradient(
    -243.435deg,
    @background2 17px,
    @separator 17px,
    @separator 21px,
    transparent 21px,
    transparent calc(100% - 22px),
    @separator calc(100% - 22px),
    @separator calc(100% - 18px),
    transparent calc(100% - 18px)
  );
}

#waybar.main #tags button {
  color: @subtext0;
  background: transparent;
  border: 1.5px solid transparent;
  padding: 6px 16px;
  transition: all 0.25s ease;
  font-style: italic;
  margin-left: -17px;
  background-image: linear-gradient(
    -63.435deg,
    transparent 25%,
    @background2 25%,
    @background2 75%,
    transparent 75%
  );
}

#waybar.main #tags button.visible {
  color: @text-primary;
  background-image: linear-gradient(
    -63.435deg,
    transparent 25%,
    @caution 25%,
    @caution 75%,
    transparent 75%
  );
}

#waybar.main #tags button.focused {
  color: @window;
  background-image: linear-gradient(
    -63.435deg,
    transparent 24%,
    @separator 24%,
    @separator 28%,
    @background1 28%,
    @background1 73%,
    @separator 73%,
    @separator 76%,
    transparent 76%
  );
}

#waybar.main #tags button:hover {
  color: @window;
}

#waybar.main #tags button.focused:hover {
  color: @background2;
  background-image: linear-gradient(
    -63.435deg,
    transparent 24%,
    @separator 24%,
    @separator 28%,
    @window 28%,
    @window 73%,
    @separator 73%,
    @separator 76%,
    transparent 76%
  );
}

#waybar.main #tags button.special.focused {
  transition: all 0s ease;
  border: 1.5px solid transparent;
  color: @separator;
  animation-iteration-count: infinite;
  animation-direction: alternate;
  animation-name: blink-special-workspace;
  animation-duration: 1s;
  animation-timing-function: steps(15);
}
/* }}} */

/* Custom icons as spacers */
/* {{{ */
#waybar.main #custom-spacer1,
#waybar.main #custom-spacer2,
#waybar.main #custom-spacer3,
#waybar.main #custom-spacer4,
#waybar.main #custom-spacer5,
#waybar.main #custom-spacer6 {
  font-size: 16pt;
  font-weight: bold;
  color: transparent;
  padding-left: 4px;
  padding-right: 4px;
  margin-bottom: -4px;
  margin-top: -4px;
}

#waybar.main #custom-spacer1 {
  background-image: linear-gradient(
    63.435deg,
    transparent 47.5%,
    @separator 47.6%,
    @separator 52.4%,
    @background1 52.5%
  );
}

#waybar.main #custom-spacer2 {
  background-image: linear-gradient(
    63.435deg,
    @background1 47.5%,
    @separator 47.6%,
    @separator 52.4%,
    @background2 52.5%
  );
}

#waybar.main #custom-spacer3 {
  background-image: linear-gradient(
    63.435deg,
    @background2 47.5%,
    @separator 47.6%,
    @separator 52.4%,
    @background1 52.5%
  );
}

#waybar.main #custom-spacer4 {
  background-image: linear-gradient(
    63.435deg,
    @background1 47.5%,
    @separator 47.6%,
    @separator 52.4%,
    @background2 52.5%
  );
}

#waybar.main #custom-spacer5,
#waybar.main #custom-spacer6 {
  background-image: linear-gradient(
    -63.435deg,
    transparent 47.5%,
    @separator 47.6%,
    @separator 52.4%,
    transparent 52.5%
  );
}
/* }}} */

/* Custom tray icon */
/* {{{ */
#waybar.main #custom-trayicon {
  font-size: 11pt;
  color: transparent;
  font-style: italic;
  background: transparent;
  padding-right: 0pt;
  padding-left: 2pt;
  background-size: 16px;
  background-position: 2px, 0px;
  background-repeat: no-repeat;
  background-image: url("/home/jan-aarela/.config/hypr/themes/Mocha-Power/pacman.png");
}
/* }}} */

/* Tooltip */
/* {{{ */
tooltip {
  background: @base;
  border: 3px solid @caution;
  border-radius: 8px;
  font-weight: 500;
  font-family: "JetBrains Mono Nerd Font";
  color: @text-primary;
}

#waybar.main #tray menu {
  background: @base;
  border: 3px solid @caution;
  border-radius: 8px;
}
/* }}} */

/* Indicator bar keyframes */
/* {{{ */
@keyframes blink-critical-battery {
  to {
    border-color: @warning;
    box-shadow:
      inset 0px 3px 4px -5px @warning,
      inset 0px -3px 4px -5px @warning;
  }
}

@keyframes blink-warning-battery {
  to {
    border-color: @warning;
    box-shadow:
      inset 0px 3px 4px -5px @warning,
      inset 0px -3px 4px -5px @warning;
  }
}

@keyframes blink-discharging-battery {
  to {
    border-color: @warning;
    box-shadow:
      inset 0px 3px 4px -5px @warning,
      inset 0px -3px 4px -5px @warning;
  }
}

@keyframes blink-charging-battery {
  to {
    border-color: @misc;
    box-shadow:
      inset 0px 3px 4px -5px @misc,
      inset 0px -3px 4px -5px @misc;
  }
}

@keyframes blink-full-battery {
  to {
    border-color: @misc;
    box-shadow:
      inset 0px 3px 4px -5px @misc,
      inset 0px -3px 4px -5px @misc;
  }
}
/* }}} */

/* Custom logo icon */
#custom-logo {
    margin-left: 8px;
    padding: 0 12px;
    font-size: 22px;
    color: @subtext0;
    transition: color 0.4s ease;
}
  '';

}
