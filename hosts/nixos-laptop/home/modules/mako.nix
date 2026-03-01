{ config, pkgs, ... }:

{
  home.file.".config/mako/config".text = ''
sort=-time
layer=overlay
background-color=#0f0e08
text-color=#f45f0c
width=300
height=110
border-size=4
border-radius=0
icons=0
max-icon-size=64
default-timeout=5000
ignore-timeout=1
font=monospace 14

[urgency=low]
border-color=#1d211e
text-color=#c8bda2

[urgency=normal]
border-color=#314277
text-color=#f45f0c

[urgency=high]
border-color=#f45f0c
text-color=#f45f0c
default-timeout=0

[category=mpd]
default-timeout=2000
group-by=category
border-color=#5073bf
text-color=#c8bda2
'';

}
