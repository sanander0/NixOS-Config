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
  background-color: #282828;          /* bg0 */
  border: 2px solid #d79921;          /* yellow accent */
  border-radius: 0.75rem;
}

* {
  font-family: "JetBrains Mono";
  font-size: 1rem;
  color: #ebdbb2;                     /* fg */
}

#scroll {
  padding: 0.75rem;
  scrollbar-color: #d79921 #3c3836;   /* yellow thumb / bg1 track */
}

#input {
  background-color: #3c3836;          /* bg1 */
  color: #fabd2f;                     /* bright yellow accent */
  border: 2px solid #d79921;          /* yellow border */
  border-radius: 0.5rem;
  padding: 0.5rem;
  outline: none;
}

/* Selected item */
#listbox row:selected {
  background-color: #504945;          /* bg2 */
  color: #ebdbb2;
}

/* Hover */
#listbox row:hover {
  background-color: #665c5480;        /* bg3 with transparency */
  color: #ebdbb2;
}

/* Placeholder */
#input placeholder {
  color: #d7992180;                   /* yellow transparent */
}
  '';

}
