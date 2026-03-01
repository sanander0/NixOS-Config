{ config, pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "wayfire";
        user = "sanander";
      };
    };
  };
}
