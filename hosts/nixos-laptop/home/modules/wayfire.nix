{ config, pkgs, ... }:

{
  home.file.".config/wayfire.ini".text = ''
[core]
# Плагины, которые будут загружены при старте
plugins = core command move resize switcher grid scale expo vswitch wf-shell

# Цвет фона, если не установлен обои
background_color = #1a1a1a

# Фокус следует за курсором (0 - нет, 1 - да)
focus_follows_mouse = 0

# Скорость анимаций
animation_duration = 200

[input]
# Настройки клавиатуры
kb_options = grp:win_space_toggle
kb_layout = us,ru

# Настройки тачпада (если ноутбук)
touchpad_click_method = button_areas
touchpad_disable_wtyping = true
touchpad_natural_scroll = true

# Скорость курсора
pointer_speed = 0

[command]
# Команды для запуска (вызываются через хоткеи)
command/terminal = alacritty
command/launcher = wofi --show drun
command/file_manager = nemo
command/brightness_up = brightnessctl set +5%
command/brightness_down = brightnessctl set 5%-

[bindings]
# --- Запуск приложений ---
binding/terminal = <super> KEY_ENTER
binding/launcher = <super> KEY_D
binding/file_manager = <super> KEY_E

# --- Управление окнами ---
binding/close = <super> KEY_Q
binding/maximize = <super> KEY_UP
binding/minimize = <super> KEY_DOWN
binding/fullscreen = <super> KEY_F

# --- Перемещение и изменение размера (мышь) ---
binding/move = <super> BTN_LEFT
binding/resize = <super> BTN_RIGHT

# --- Переключение окон (Alt-Tab) ---
binding/switcher = <alt> KEY_TAB
binding/switcher_backward = <alt> <shift> KEY_TAB

# --- Рабочие места (Workspaces) ---
# Переключение на конкретное место
binding/workspace_1 = <super> KEY_1
binding/workspace_2 = <super> KEY_2
binding/workspace_3 = <super> KEY_3
binding/workspace_4 = <super> KEY_4
binding/workspace_5 = <super> KEY_5
binding/workspace_6 = <super> KEY_6
binding/workspace_7 = <super> KEY_7
binding/workspace_8 = <super> KEY_8
binding/workspace_9 = <super> KEY_9

# Переключение стрелками
binding/vswitch_up = <super> <ctrl> KEY_UP
binding/vswitch_down = <super> <ctrl> KEY_DOWN
binding/vswitch_left = <super> <ctrl> KEY_LEFT
binding/vswitch_right = <super> <ctrl> KEY_RIGHT

# --- Сетка (Grid) - прилепление окон ---
binding/grid_left = <super> KEY_LEFT
binding/grid_right = <super> KEY_RIGHT
binding/grid_top = <super> KEY_UP
binding/grid_bottom = <super> KEY_DOWN
binding/grid_center = <super> KEY_C

# --- Обзор окон (Scale) ---
binding/scale = <super> KEY_S
binding/scale_all = <super> KEY_W

# --- Экспо (Обзор рабочих мест) ---
binding/expo = <super> KEY_X

[move]
# Активация перемещения (дублирование для надежности)
activate = <super> BTN_LEFT

[resize]
# Активация изменения размера
activate = <super> BTN_RIGHT

[scale]
# Настройка режима обзора окон
allow_zoom = true
inactive_alpha = 0.75

[grid]
# Настройка сетки
slot_bl = <super> KEY_KP_1
slot_b = <super> KEY_KP_2
slot_br = <super> KEY_KP_3
slot_l = <super> KEY_KP_4
slot_c = <super> KEY_KP_5
slot_r = <super> KEY_KP_6
slot_tl = <super> KEY_KP_7
slot_t = <super> KEY_KP_8
slot_tr = <super> KEY_KP_9

[expo]
# Настройка обзора рабочих столов
offset = 50
background = #1a1a1a

[vswitch]
# Настройка переключения рабочих столов
wrap = true

[wallpaper]
# Если не используете wf-shell для обоев
# background = /path/to/image.jpg
# preserve_aspect = true
  '';

}
