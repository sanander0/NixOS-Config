{ pkgs, ... }: 
{
  xdg = {
    portal = {
      enable = true;
      # wlroots‑портал (экран, окна и т.п.)
      wlr.enable = true;                # добавит xdg-desktop-portal-wlr [web:9]

      # Дополнительные порталы (файловый диалог, темы и т.п.)
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk         # файловый диалог, открытие ссылок [web:6]
      ];

      # Какой бэкенд за что отвечает
      config = {
        common = {
          # порядок «по умолчанию»
          default = [ "wlr" "gtk" ];    # сначала wlr, потом gtk [web:3]
        };

        river = {
          # десктоп‑имя можно поставить river, если экспортируете XDG_CURRENT_DESKTOP=river
          default = [ "wlr" "gtk" ];
        };
      };
    };
  };
  environment.sessionVariables = {
  XDG_SESSION_TYPE = "wayland";
  XDG_CURRENT_DESKTOP = "river";
  XDG_SESSION_DESKTOP = "river";
};
}
