{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.system.desktop.gnome.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    # GNOME specific fixes/apps
    environment.systemPackages = with pkgs; [
      gnome-tweaks
      gnome-extension-manager
    ];

    # Example: Remove bloatware
    environment.gnome.excludePackages = with pkgs; [
      geary
      epiphany
    ];
  };
}
