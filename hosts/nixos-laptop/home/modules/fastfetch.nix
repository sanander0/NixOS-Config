{ config, pkgs, ... }:

{
  home.file.".config/fastfetch/config.jsonc".text = ''
{
    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
    "logo": {
        "padding": {
        "left": 1,
        "top": 2
    },
    },
    "modules": [
        "break",
        {
            "type": "custom",
            "format": "\u001b[90m┌─────────────────────Hardware─────────────────────┐"
        },
        {
            "type": "host",
            "key": "PC:"
        },
        {
            "type": "cpu",
            "key": "│ ├",
        },
        {
            "type": "gpu",
            "key": "│ ├",
        },
        {
            "type": "memory",
            "key": "│ ├",
        },
        {
            "type": "disk",
            "key": "└ └",
        },
        {
            "type": "custom",
            "format": "\u001b[90m└──────────────────────────────────────────────────┘"
        },
        "break",
        {
            "type": "custom",
            "format": "\u001b[90m┌─────────────────────Software─────────────────────┐"
        },
        {
            "type": "os",
            "key": "OS",
        },
        {
            "type": "kernel",
            "key": "│ ├",
        },
        {
            "type": "packages",
            "key": "│ ├",
        },
        {
            "type": "shell",
            "key": "└ └",
        },
        "break",
        {
            "type": "wm",
            "key": "WM",
        },
        {
            "type": "terminal",
            "key": "└ └",
        },
        {
            "type": "custom",
            "format": "\u001b[90m└──────────────────────────────────────────────────┘"
        },
        "break",
        {
            "type": "custom",
            "format": "\u001b[90m┌───────────────────Uptime / Age / DT───────────────────┐"
        },
        {
            "type": "command",
            "key": "  OS Age ",
            "text": "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days"
        },
        {
            "type": "uptime",
            "key": "  Uptime ",
        },
        {
            "type": "datetime",
            "key": "  DateTime ",
        },
        {
            "type": "custom",
            "format": "\u001b[90m└───────────────────────────────────────────────────────┘"
        },
        {
            "type": "colors",
            "paddingLeft": 2,
            "symbol": "circle"
        }
    ]
}
  '';

}
