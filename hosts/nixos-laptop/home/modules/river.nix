{ config, pkgs, ... }:

{
  home.file.".config/river/init" = {
    text = ''
#!/usr/bin/env bash

#----layout генератор----

#RiverTile

rivertile -view-padding 2 -outer-padding 2 &
riverctl default-layout rivertile

#----Автозапуск----

#Запуск layout генератора
rivertile &

#Waybar
waybar &

#Демон обоев
swww-daemon &

#Блокировка

#polkit
/usr/libexec/polkit-mate-authentication-agent-1 &

#----Техничка----

#размер мастер окна
riverctl send-layout-cmd rivertile "main-ratio -0.05"

#Переключение раскладки клавиатуры
riverctl keyboard-layout -options "grp:alt_shift_toggle" "us,ru"

#Переключение фокуса на окно на которм находиться курсор
riverctl focus-follows-cursor always

#Включение тапа по тачпаду
riverctl input pointer-1267-13075-ASCE1205:00_04F3:3313_Touchpad events enable
riverctl input pointer-1267-13075-ASCE1205:00_04F3:3313_Touchpad tap enabled
riverctl input pointer-1267-13075-ASCE1205:00_04F3:3313_Touchpad drag enabled
#----Красивости----

#Увелечение масштаба интерфеса
wlr-randr --output eDP-1 --scale 1.2

#Обои
swww img ~/Wallpaper/wallhaven-x6x3gz.png &

# Цвет рамки активного окна
riverctl border-color-focused 0xabbcda 

# Цвет рамки неактивного окна
riverctl border-color-unfocused 0x424153

# Толщина рамки в пикселях
riverctl border-width 2

#----Бинды----

# Яркость вверх/вниз (на функциональных клавишах)
riverctl map normal None XF86MonBrightnessUp spawn "brightnessctl set +5%"
riverctl map normal None XF86MonBrightnessDown spawn "brightnessctl set 5%-"

# Громкость вверх/вниз/мут на функциональных клавишах
riverctl map normal None XF86AudioRaiseVolume spawn "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
riverctl map normal None XF86AudioLowerVolume spawn "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%-"
riverctl map normal None XF86AudioMute spawn "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

#Бинд на переключение фокусировки окон
riverctl map -layout 0 normal Super left focus-viev next
riverctl map -layout 0 normal Super right focus-viev previous

#Бинд на свап окон
riverctl map -layout 0 normal Super J swap next
riverctl map -layout 0 normal Super K swap previous

#Бинд floating-tiling
riverctl map normal Super+Shift F toggle-float

#Бинд перетакивание плавающих окон
riverctl map-pointer normal Super BTN_LEFT move-view

#Бинд resize плавающих окон
riverctl map-pointer normal Super BTN_RIGHT resize-view

#Бинд переключение между тегами
riverctl map normal Super 1 set-focused-tags 1
riverctl map normal Super 2 set-focused-tags 2
riverctl map normal Super 3 set-focused-tags 4
riverctl map normal Super 4 set-focused-tags 8
riverctl map normal Super 5 set-focused-tags 16
riverctl map normal Super 6 set-focused-tags 32
riverctl map normal Super 7 set-focused-tags 64
riverctl map normal Super 8 set-focused-tags 128
riverctl map normal Super 9 set-focused-tags 256

#Бинд перемещения окна на другой тег
riverctl map normal Super+Shift 1 set-view-tags 1
riverctl map normal Super+Shift 2 set-view-tags 2
riverctl map normal Super+Shift 3 set-view-tags 4
riverctl map normal Super+Shift 4 set-view-tags 8
riverctl map normal Super+Shift 5 set-view-tags 16
riverctl map normal Super+Shift 6 set-view-tags 32
riverctl map normal Super+Shift 7 set-view-tags 64
riverctl map normal Super+Shift 8 set-view-tags 128
riverctl map normal Super+Shift 9 set-view-tags 256

#Закрыть Окно
riverctl map -layout 0 normal Super C close

#Выход из river
riverctl map -layout 0 normal Super M  exit

#Бинд wofi
riverctl map -layout 0 normal Super W spawn "pgrep -x wofi && pkill wofi || wofi --show drun -I"

#Бинд скриншот
riverctl map -layout 0 normal  None Print spawn 'grim -g "$(slurp)" - | tee ~/Pictures/Screenshots/$(date +"%Y-%m-%d-%H%M%S").png | wl-copy && notify-send "Скриншот сохранён и в буфере"'

#Бинд colorpicker
riverctl map normal None F12 spawn "~/Scripts/colorpicker"

#cava & cmus
riverctl map -layout 0 normal Super A spawn "~/Scripts/music.sh"

#Спавн терминала
riverctl map -layout 0 normal Super Q  spawn alacritty

#Спавн Explorer
riverctl map -layout 0 normal Super E  spawn nemo

#Спавн firefox
riverctl map -layout 0 normal Super B  spawn firefox

#Спавн Telegram
riverctl map -layout 0 normal Super T  spawn Telegram

#----Правила Окон----

#AmneziaVPN - в плавающем режеми по центру экрана
riverctl rule-add -app-id "AmneziaVPN" -title "AmneziaVPN" float
riverctl rule-add -app-id "AmneziaVPN" -title "AmneziaVPN" position center center

#FireFox
riverctl rule-add -title "Выгрузка файла - Mozilla Firefox" float
riverctl rule-add -title "Выгрузка файла - Mozilla Firefox" dimensions 800 600
riverctl rule-add -title "Выгрузка файла - Mozilla Firefox" position center center

#File-Roller
riverctl rule-add -app-id "org.gnome.FileRoller" position center center
riverctl rule-add -app-id "org.gnome.FileRoller" dimensions 800 600
riverctl rule-add -app-id "org.gnome.FileRoller" float

riverctl rule-add -app-id "org.gnome.FileRoller" -title "Extract" position center center
riverctl rule-add -app-id "org.gnome.FileRoller" -title "Extract" dimensions 1000 800
riverctl rule-add -app-id "org.gnome.FileRoller" -title "Extract" float

riverctl rule-add -app-id "imv" float
riverctl rule-add -app-id "imv" position center
riverctl rule-add -app-id "imv" dimensions 1000 800

#----Переменные окружения----

systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE
systemctl --user restart xdg-desktop-portal xdg-desktop-portal-wlr
  '';
  executable = true;
};
}

