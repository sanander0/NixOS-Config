{ config, pkgs, ... }:

{
  home.file.".config/mako/config".text = ''
# Colors (Gruvbox Dark)

background-color=#282828
text-color=#ebdbb2
border-color=#d79921
progress-color=over #504945

[urgency=high]
border-color=#fb4934
'';

}
