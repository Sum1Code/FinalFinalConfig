{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.system.desktop.kde.enable {
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # Enable integration for GTK apps in KDE
    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
      kdePackages.kate
      kdePackages.kcalc
    ];
  };
}
