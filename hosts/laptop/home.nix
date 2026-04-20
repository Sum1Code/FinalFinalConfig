{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix
    ../../modules/desktop/gnome-rice.nix
  ];

  home.username = "nael";
  home.homeDirectory = "/home/nael";

  # State version should match your first install's version
  # Note: 25.11 is the future! You likely want "24.11" or "24.05"
  home.stateVersion = "25.11";

  # General GUI Apps
  home.packages = with pkgs; [
    mission-center
    winboat
    # The Nix tools you need for Zed to work
    nixd
    nixpkgs-fmt
  ];

  programs.lutris.enable = true;
  programs.home-manager.enable = true;
  xdg.enable = true;
}
