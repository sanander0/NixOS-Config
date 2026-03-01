{ config, pkgs, ... }:

{
  home.file.".config/waybar/config.jsonc".text = ''
[
  {
    // MAIN BAR //
    "layer": "top",
    "position": "top",
    "name": "main",
    "height": 28,
    "reload_style_on_change": true,
    "output": "DP-2",

    "margin-top": 5,
    "margin-left": 5,
    "margin-right": 5,

    "modules-left": [
    "custom/logo",
      "niri/workspaces",
      "niri/window",
    ],

    "modules-right": [
      "group/traym",
      "custom/spacer1",
      "cpu",
      // "group/storage",
      "memory#ram",
      "memory#swap",
      "disk",
      "network#info",
      "custom/spacer2",
      "pulseaudio#input",
      "pulseaudio#output",
      "custom/spacer3",
      "niri/language",
      "custom/spacer4",
      "clock",
    ],

    // Modules
    "disk": {
      "interval": 16,
      "format": " {percentage_used}%",
      "tooltip": "{}",
      "tooltip-format": "Free {free}",
      "states": {
        "warning": 85,
        "critical": 95,
      },
    },

    "group/traym": {
      "orientation": "horizontal",
      "modules": ["custom/trayicon", "tray"],
    },

	"custom/logo": {
    "format": " ",
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
      "format": " {usage}%",
      "states": {
        "warning": 80,
        "critical": 95,
      },
    },

    "niri/language": {
      "format": " {}",
      "format-en": "Fuck",
      "format-ru": "Блять",
      "min-length": 8,
      "tooltip": false,
      "class": "language",
    },

    "memory#ram": {
      "interval": 4,
      "format": " {percentage}%",
      "states": {
        "warning": 80,
        "critical": 95,
      },
      "tooltip": "{}",
      "tooltip-format": "{used}/{total} GiB",
    },

    "memory#swap": {
      "interval": 16,
      "format": "󰾵 {swapPercentage}%",
      "tooltip": "{}",
      "tooltip-format": "{swapUsed}/{swapTotal}GiB",
    },

    "network#info": {
      "interval": 2,
      "format": "󱘖  Offline",
      "format-wifi": "{icon} {bandwidthDownBits}",
      "format-ethernet": "󰈀 {bandwidthDownBits}",
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

    "niri/window": {
      "format": "{title}",
      "max-length": 48,
      "tooltip": false,
    },

    "niri/workspaces": {
      "disable-scroll-wraparound": true,
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
        "default": ["", ""],
      },
      "on-click": "pactl set-sink-mute @DEFAULT_SINK@ toggle",
      "on-click-right": "pwvucontrol & aplay ~/.config/sounds/interact.wav",
      "on-scroll-down": "sh -c 'vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP \"\\d+(?=%)\" | head -1); if [ \"$vol\" -lt 100 ]; then pactl set-sink-volume @DEFAULT_SINK@ +2%; else pactl set-sink-volume @DEFAULT_SINK@ 110%; fi'",
      "on-scroll-up": "pactl set-sink-volume @DEFAULT_SINK@ -2%",
      "tooltip": true,
      "scroll-step": 4,
    },

    "pulseaudio#input": {
      "format": " {format_source}%",
      "format-source": "{volume}",
      "format-source-muted": "{volume}",
      "on-scroll-down": "sh -c 'vol=$(pactl get-source-volume @DEFAULT_SOURCE@ | grep -oP \"\\d+(?=%)\" | head -1); if [ \"$vol\" -lt 100 ]; then pactl set-source-volume @DEFAULT_SOURCE@ +2%; else pactl set-source-volume @DEFAULT_SOURCE@ 110%; fi'",
      "on-scroll-up": "pactl set-source-volume @DEFAULT_SOURCE@ -2%",
      "max-volume": "100",
      "on-click": "pactl set-source-mute @DEFAULT_SOURCE@ toggle",
      "on-click-right": "pwvucontrol & aplay ~/.config/sounds/interact.wav",
      "tooltip-format": "{source_desc}",
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

/* Define colors */
/* {{{ */
/* Gruvbox Dark palette */

@define-color background1 #3c3836;  /* bg1 */
@define-color background2 #282828;  /* bg0 */
@define-color sepepator  #504945;  /* bg2 */

@define-color warning    #fb4934;  /* bright red */
@define-color caution    #665c54;  /* bg3 */

@define-color performance #fabd2f; /* bright yellow */
@define-color audio       #d3869b; /* bright purple */
@define-color misc        #8ec07c; /* bright aqua */
@define-color date        #b8bb26; /* bright green */

@define-color work        #83a598; /* bright blue */
@define-color window      #83a598; /* bright blue */
@define-color resize      #fe8019; /* bright orange */
@define-color process     #83a598; /* blue */

@define-color text        #ebdbb2; /* fg */
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

/* Keyframes for main bar criticals */

@keyframes blink-urgent-workspace {
  to {
    color: @warning;
    /* background-image: linear-gradient( */
    /*   -63.435deg, */
    /*   transparent 25%, */
    /*   @warning 25%, */
    /*   @warning 75%, */
    /*   transparent 75% */
    /* ); */
  }
}

@keyframes blink-critical-text {
  to {
    color: @sepepator;
  }
}

/* Keyframes for main bar modifiers */
@keyframes blink-modifier-text {
  to {
    color: @sepepator;
  }
}

@keyframes blink-special-workspace {
  to {
    color: @window;
  }
}

/* }}} */

/* Main bar defaults */
/* {{{ */
#waybar.main {
  background: @background2;
  font-family: "JetBrainsMono Nerd Font propo";
  /* font-family: "gohufont11 nerd font propo"; */
  font-size: 12pt;
  font-weight: 600;
  color: @text;
  border-radius: 0pt;
  /* box-shadow: */
  /*   inset 0px 5px 4px -5px rgba(170, 190, 255, 0.5), */
  /*   inset 0px -5px 4px -5px rgba(170, 190, 255, 1); */
}

#waybar.main button {
  font-family: "JetBrains Mono Nerd Font propo";
  font-size: 12pt;
  font-weight: 600;
  color: @text;
}

/* }}} */

/* Main bar modules */
/* {{{ */
#cava,
#waybar.main #custom-headsetbattery,
#waybar.main #custom-nvidia,
#waybar.main #custom-weather,
#waybar.main #custom-weather,
#waybar.main #custom-battery,
#waybar.main #keyboard-state,
#waybar.main #network,
#waybar.main #battery,
#waybar.main #backlight,
#waybar.main #clock,
#waybar.main #cpu,
#waybar.main #language,
#waybar.main #memory.swap,
#waybar.main #memory.ram,
#waybar.main #submap,
#waybar.main #pulseaudio,
#waybar.main #temperature,
#waybar.main #traym,
#waybar.main #window,
#waybar.main #disk,
#custom-timer {
  padding-left: 8pt;
  padding-right: 8pt;
}

#waybar.main #custom-weather {
  padding-right: 8pt;
}

#waybar.main #custom-nvidia {
  margin-top: -4px;
  margin-bottom: -4px;
}

/* }}} */

/* Module colors */
/* {{{ */
#waybar.main #custom-nvidia,
#waybar.main #cpu,
#waybar.main #temperature,
#waybar.main #memory.ram,
#waybar.main #memory.swap,
#waybar.main #disk,
#waybar.main #network {
  color: @performance;
  background: @background1;
}

#cava {
  font-size: 12px;
}

#cava,
#waybar.main #custom-headsetbattery,
#waybar.main #pulseaudio {
  color: @audio;
  background: @background2;
}

#waybar.main #custom-battery,
#waybar.main #language,
#waybar.main #backlight,
#waybar.main #battery {
  color: @misc;
  background: @background1;
}

#waybar.main #custom-weather,
#waybar.main #clock,
#custom-timer {
  color: @date;
  background: @background2;
}

#waybar.main #clock {
  border-radius: 0pt 6pt 6pt 0pt;
}

#waybar.main #window {
  color: @window;
  box-shadow: none;
  font-style: italic;
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

/* Submap */
/* {{{ */
#waybar.main #submap.󰲏 {
  color: @resize;
  animation-iteration-count: infinite;
  animation-direction: alternate;
  animation-name: blink-modifier-text;
  animation-duration: 1s;
  animation-timing-function: steps(15);
  box-shadow: none;
}

#waybar.main #submap. {
  color: @date;
  animation-iteration-count: infinite;
  animation-direction: alternate;
  animation-name: blink-modifier-text;
  animation-duration: 1s;
  animation-timing-function: steps(15);
  box-shadow: none;
}

/* }}} */

/* Main bar criticals */
/* {{{ */
#waybar.main #custom-nvidia.critical,
/* #waybar.main #custom-battery.critical, */
#waybar.main #custom-headsetbattery.critical,
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

#waybar.main #workspaces button.urgent,
#waybar.main #workspaces button.special.urgent {
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
  color: @sepepator;
}
#waybar.main #custom-headsetbattery.low,
#waybar.main #custom-battery.warning,
#waybar.main #custom-battery.critical {
  color: @warning;
}

/* }}} */

/* Battery chargin */
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
/* Default workspace settings */

#waybar.main #workspaces {
  /* background: @warning; */
  padding-left: 20px;
  padding-right: 4px;
  margin-top: -6px;
  margin-bottom: -6px;
  background-image: linear-gradient(
    -243.435deg,
    @background2 17px,
    @sepepator 17px,
    @sepepator 21px,
    transparent 21px,
    transparent calc(100% -22px),
    @sepepator calc(100% -22px),
    @sepepator calc(100% - 18px),
    transparent calc(100% - 18px)
  );
}

#waybar.main #workspaces button {
  color: #45475a;
  background: transparent;
  border: 1.5px solid transparent;
  padding-left: 4pt;
  padding-right: 4pt;
  transition: all 0.25s ease;
  padding-right: 16px;
  padding-left: 16px;
  font-style: italic;
  margin-left: -17px;
  padding-top: 6px;
  padding-bottom: 6px;
  background-image: linear-gradient(
    -63.435deg,
    transparent 25%,
    @background2 25%,
    @background2 75%,
    transparent 75%
  );
}

/* Focused workspace */
#waybar.main #workspaces button.visible {
  color: @text;
  background-image: linear-gradient(
    -63.435deg,
    transparent 25%,
    @caution 25%,
    @caution 75%,
    transparent 75%
  );
}

/* Focused workspace & monitor */
#waybar.main #workspaces button.active {
  color: @window;
  background-image: linear-gradient(
    -63.435deg,
    transparent 24%,
    @sepepator 24%,
    @sepepator 28%,
    @background1 28%,
    @background1 73%,
    @sepepator 73%,
    @sepepator 76%,
    transparent 76%
  );
}

/* Style when cursor is on the button */
#waybar.main #workspaces button:hover {
  color: @window;
}

/* #waybar.main #workspaces button.active:hover { */
/*   color: @background2; */
/*   background-image: linear-gradient( */
/*     -63.435deg, */
/*     transparent 24%, */
/*     @sepepator 24%, */
/*     @sepepator 28%, */
/*     @window 28%, */
/*     @window 73%, */
/*     @sepepator 73%, */
/*     @sepepator 76%, */
/*     transparent 76% */
/*   ); */
/* } */

/* Special workplace animation */
#waybar.main #workspaces button.special.active {
  transition: all 0s ease;
  border: 1.5px solid transparent;
  color: @sepepator;
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
    @transparent 47.5%,
    @sepepator 47.6%,
    @sepepator 52.4%,
    @background1 52.5%
  );
}

#waybar.main #custom-spacer2 {
  background-image: linear-gradient(
    63.435deg,
    @background1 47.5%,
    @sepepator 47.6%,
    @sepepator 52.4%,
    @background2 52.5%
  );
}

#waybar.main #custom-spacer3 {
  background-image: linear-gradient(
    63.435deg,
    @background2 47.5%,
    @sepepator 47.6%,
    @sepepator 52.4%,
    @background1 52.5%
  );
}

#waybar.main #custom-spacer4 {
  background-image: linear-gradient(
    63.435deg,
    @background1 47.5%,
    @sepepator 47.6%,
    @sepepator 52.4%,
    @background2 52.5%
  );
}

#waybar.main #custom-spacer5 {
  background-image: linear-gradient(
    -63.435deg,
    @transparent 47.5%,
    @sepepator 47.6%,
    @sepepator 52.4%,
    transparent 52.5%
  );
}

#waybar.main #custom-spacer6 {
  background-image: linear-gradient(
    -63.435deg,
    @transparent 47.5%,
    @sepepator 47.6%,
    @sepepator 52.4%,
    transparent 52.5%
  );
}

/* }}} */

/* Custom tray icon */
/* {{{ */
#waybar.main #custom-trayicon {
  font-size: 11pt;
  color: transparent;
  /* font-weight: bold; */
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
  background: @background;
  border: 3px solid @caution;
  border-radius: 8px;
  font-weight: 500;
  font-family: "JetBrains Mono Nerd Font";
}

#waybar.main #tray menu {
  background: @background;
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

/* indicator bar battery module */
/* {{{ */

/* Set defaults for indicator bar */
#waybar.indicator {
  font-size: 10px;
  /* This makes indicator thicker */
  color: rgba(0, 0, 0, 0);
  background: rgba(0, 0, 0, 0);
}

/* Set "battery bar" style */
#waybar.indicator #custom-batteryindicator {
  border: 2.5px solid @sepepator;
  background: transparent;
  box-shadow:
    inset 0px 4px 4px -5px rgba(0, 0, 0, 0.5),
    inset 0px -4px 4px -5px rgba(0, 0, 0, 0.5);

  border-radius: 7px;
  padding-left: 2502px;
  /* Use this for padding:  */
  /* (H_rez / scaling) - L_margin -R_margin - 2 * border - (font-size / 2)*/
  /* For example: (2880px / 1.25) - 24 - 24 - 2 * 2.5 - (27 / 2) = 2237.5px */
}

/* Blink red when battery is very low */
#waybar.indicator #custom-batteryindicator.critical {
  animation-iteration-count: infinite;
  animation-direction: alternate;
  animation-name: blink-critical-battery;
  animation-duration: 1s;
  animation-timing-function: steps(15);
}

/* Blink red twice when battry is low battery */
#waybar.indicator #custom-batteryindicator.warning {
  animation-iteration-count: 4;
  animation-direction: alternate;
  animation-name: blink-warning-battery;
  animation-duration: 0.2s;
  animation-timing-function: steps(15);
}

/* Blink once red when disconnected from AC */
#waybar.indicator #custom-batteryindicator.discharging {
  animation-iteration-count: 2;
  animation-direction: alternate;
  animation-name: blink-discharging-battery;
  animation-duration: 0.3s;
  animation-timing-function: steps(15);
}

/* Blink once cyan when plugged to AC */
#waybar.indicator #custom-batteryindicator.charging {
  animation-iteration-count: 2;
  animation-direction: alternate;
  animation-name: blink-charging-battery;
  animation-duration: 0.3s;
  animation-timing-function: steps(15);
}

/* Blink cyan twice when battery is full */
#waybar.indicator #custom-batteryindicator.full {
  animation-iteration-count: 4;
  animation-direction: alternate;
  animation-name: blink-full-battery;
  animation-duration: 0.2s;
  animation-timing-function: steps(15);
}

/* }}} */

/* Кастомная иконка (Arch / Logo) */
#custom-logo {
    margin-left: 8px;
    padding: 0 12px;
    font-size: 22px;
    color: #a6adc8;
    transition: color 0.4s ease;
}
  '';

}
