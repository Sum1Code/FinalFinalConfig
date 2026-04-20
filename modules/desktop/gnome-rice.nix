{ pkgs, osConfig, config, lib, ... }:

{
  config = lib.mkIf osConfig.system.desktop.gnome.enable {
    # Extensions
    home.packages = with pkgs; [
      gnomeExtensions.dash-to-dock
      gnomeExtensions.blur-my-shell
      gnomeExtensions.gpu-supergfxctl-switch
    ];

    # Stylix & GTK
    stylix.targets.gnome.enable = true;
    stylix.targets.gtk.enable = true;

    gtk = {
      enable = true;
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
    };

    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "dash-to-dock@micxgx.gmail.com"
          "blur-my-shell@aunetx"
          "gpu-switcher-supergfxctl@chikobara.github.io"
        ];
      };

      "org/gnome/shell/keybindings" = {
        toggle-application-view = [ "Super_L" ];
      };

      "org/gnome/desktop/wm/keybindings" = {
        panel-main-menu = [ "" ];
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        dock-position = "BOTTOM";
        dash-max-icon-size = 48;
        autohide = true;
        extend-height = false;
        transparency-mode = "FIXED";
        background-opacity = 0.8;
        show-mounts = false;
      };

      "org/gnome/shell/extensions/blur-my-shell/appgrid" = {
        analyze-load = true;
        opacity = 0;
      };

      "org/gnome/shell/extensions/blur-my-shell/overview" = {
        style-components = 0;
      };
    };
  };
}
