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
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
