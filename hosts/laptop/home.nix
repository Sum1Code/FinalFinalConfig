{ config, pkgs, ... }:

{
  home.username = "nael";
  home.homeDirectory = "/home/nael";

  # User-specific packages (CLI tools, etc.)
  home.packages = with pkgs; [
    htop
    fastfetch
    winboat
    mission-center
    nixd # The Nix language server
    nixpkgs-fmt # Optional: recommended for auto-formatting
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
  ];

  # Manage Git via Home Manager
  programs.git = {
    enable = true;
    settings.user.name = "lumahere";
    settings.user.email = "sum1hewe.dev@gmail.com";
  };
  # Manage Zsh or Bash
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "25.11";
  programs.lutris = {
    enable = true;
  };

  # This tells Home Manager to respect Stylix settings
  stylix.targets.gnome.enable = true;
  stylix.targets.gtk.enable = true;

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  xdg.enable = true;

  dconf.settings = {
    "org/gnome/shell/keybindings" = {
      # This specifically targets the "Show Applications" view
      toggle-application-view = [ "Super_L" ];
    };

    "org/gnome/desktop/wm/keybindings" = {
      # Optional: If you want to unbind the Overview to prevent conflicts
      panel-main-menu = [ "" ];
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "dash-to-dock@micxgx.gmail.com"
        "blur-my-shell@aunetx"
      ];
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      # Position and size
      dock-position = "BOTTOM";
      dash-max-icon-size = 48;

      # Behavior
      autohide = true;
      extend-height = false; # Makes it a 'floating' dock rather than a panel

      # Appearance (Stylix usually handles colors, but these help the 'Dock' look)
      transparency-mode = "FIXED";
      background-opacity = 0.8;
      show-mounts = false;
    };
    "org/gnome/shell/extensions/blur-my-shell/appgrid" = {
      analyze-load = true;
      opacity = 0; # This makes the background fully transparent
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      style-components = 0; # Set to 0 for transparent background
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
