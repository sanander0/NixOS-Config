{ config, pkgs, ... }:

{
  services.tlp.enable = true;

  environment.systemPackages = with pkgs; [
    powertop
  ];

  services.logind.settings = {
  Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchDocked = "ignore";
    HandleSleepKey = "suspend";
    HandlePowerKey = "poweroff";
  };
  };


#-----ФИКС ТАЧПАДА-----

  environment.etc."systemd/system-sleep/fix-resume".text = ''
    #!/bin/sh

    case "$1" in
      post)
        ${pkgs.kmod}/bin/modprobe -r i2c_hid_acpi || true
        ${pkgs.kmod}/bin/modprobe i2c_hid_acpi || true
      ;;
    esac
  '';

  environment.etc."systemd/system-sleep/fix-resume".mode = "0755";

#-----ФИКС WiFI-----

  environment.etc."systemd/system-sleep/fix-wifi".text = ''
    #!/bin/sh

    case "$1" in
      post)
        sleep 1

        ${pkgs.kmod}/bin/modprobe -r rtw89_8852be || true
        ${pkgs.kmod}/bin/modprobe -r rtw89_pci || true
        ${pkgs.kmod}/bin/modprobe -r rtw89_core || true

        ${pkgs.kmod}/bin/modprobe rtw89_core || true
        ${pkgs.kmod}/bin/modprobe rtw89_pci || true
        ${pkgs.kmod}/bin/modprobe rtw89_8852be || true

        systemctl restart NetworkManager.service || true
      ;;
    esac
  '';

  environment.etc."systemd/system-sleep/fix-wifi".mode = "0755";

}
