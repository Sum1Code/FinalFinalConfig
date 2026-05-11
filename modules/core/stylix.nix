{ pkgs, ... }:

{
  stylix = {
    enable = true;
    targets.gnome.enable = true;
    targets.grub.enable = true;
    targets.grub.useWallpaper = true;
    # Set a blueish dark wallpaper to anchor the theme
    image = ../../hosts/laptop/assets/wallpaper.jpg;

    # Choose the blueish dark theme
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

    # Global transparency for apps that support it
    opacity.terminal = 0.9;

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.lexend;
        name = "Lexend";
      };
    };
  };

  # Icon packs are not fully handled by Stylix automatically in GNOME/KDE
  # So we add them to the system environment
  environment.systemPackages = with pkgs; [
    papirus-icon-theme
  ];
}
