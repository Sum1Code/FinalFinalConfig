{ pkgs, config, lib, ... }:
{
  config = lib.mkIf config.system.apps.steam.enable {
    programs.steam = {
      enable = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };
  };

}
