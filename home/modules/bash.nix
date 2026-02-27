{ config, pkgs, ... }:

{
programs.bash = {
      enable = true;
      initExtra = ''
        export OSH=~/.oh-my-bash
        OSH_THEME="zork"
        plugins=(git bashmarks)
        source $OSH/oh-my-bash.sh
	fastfetch
      '';
    };

    home.activation.installOhMyBash = ''
      if [ ! -d "$HOME/.oh-my-bash" ]; then
        ${pkgs.git}/bin/git clone --depth=1 https://github.com/ohmybash/oh-my-bash.git "$HOME/.oh-my-bash"
      fi
    '';

  
}
