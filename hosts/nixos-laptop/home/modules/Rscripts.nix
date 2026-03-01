
{ config, pkgs, ... }:

{
  home.file."/Scripts/colorpicker" = {
    text = ''
#!/bin/sh
# Выбираем пиксель, берём цвет в HEX, копируем в буфер и показываем уведомление
grim -g "$(slurp -p)" -t ppm - | magick convert - -format '%[hex:p{0,0}]' info:- | wl-copy

# Уведомление с выбранным цветом (нужен libnotify или dunst/ mako)
notify-send "Цвет скопирован" "$(wl-paste)"
  '';
  executable = true;
};
}

