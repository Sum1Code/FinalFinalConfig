{ config, lib, ... }:

{
  imports = [
    ./gnome.nix
    ./kde.nix
  ];

  options.system.desktop = {
    gnome.enable = lib.mkEnableOption "GNOME Desktop";
    kde.enable = lib.mkEnableOption "KDE Plasma Desktop";
  };

  # Optional: Safety check to prevent enabling both
  config = lib.mkIf (config.system.desktop.gnome.enable && config.system.desktop.kde.enable) {
    assertions = [{
      assertion = false;
      message = "You cannot enable both GNOME and KDE at the same time!";
    }];

  };
}
