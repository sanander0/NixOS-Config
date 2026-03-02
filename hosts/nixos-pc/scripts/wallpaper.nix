{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
  ];

  system.activationScripts.downloadWallpaper.text = ''
    WALLDIR="/home/sanander/Wallpaper"
    FILE="$WALLDIR/wallhaven-p9pd23.png"

    mkdir -p "$WALLDIR"

    if [ ! -f "$FILE" ]; then
      echo "Downloading wallpaper..."
      ${pkgs.curl}/bin/curl -L \
        "https://w.wallhaven.cc/full/p9/wallhaven-p9pd23.png" \
        -o "$FILE"
    else
      echo "Wallpaper already exists, skipping."
    fi
  '';
}
