{ config, pkgs, ... }:

{
  home.file.".config/wofi/config".text = ''
show=drun
prompt=Search...
location=center
gtk-dark=true
allow_images=true
image_size=32
insensitive=true
allow_markup=true
no_actions=true
orientation=vertical
halign=fill
content_halign=fill
'';

  home.file.".config/wofi/style.css".text = ''
window {
  background-color: #1e1e2e;          /* mocha base — основной фон окна */
  border: 2px solid #cba6f7;          /* mauve — акцентный бордер */
  border-radius: 0.75rem;
}

* {
  font-family: "JetBrains Mono";
  font-size: 1rem;
  color: #cdd6f4;                     /* mocha text — основной цвет текста */
}

#scroll {
  padding: 0.75rem;
  scrollbar-color: #cba6f7 #181825;   /* mauve thumb / mantle track */
}

#input {
  background-color: #181825;          /* mocha mantle — чуть темнее основного */
  color: #cba6f7;                     /* mauve — акцентный цвет ввода */
  border: 2px solid #cba6f7;          /* mauve border */
  border-radius: 0.5rem;
  padding: 0.5rem;
  outline: none;
}

/* Hover / selected item */
#listbox row:selected {
  background-color: #45475a;          /* mocha surface2 — более заметный selected */
  color: #cdd6f4;
}

#listbox row:hover {
  background-color: #31324480;        /* mocha surface0 с прозрачностью — лёгкий hover */
  color: #cdd6f4;
}

/* Placeholder */
#input placeholder {
  color: #cba6f780;                   /* mauve с прозрачностью */
}
  '';

}
