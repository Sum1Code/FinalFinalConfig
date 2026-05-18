{ config, pkgs, ... }:

{
  imports = [
    ./shell.nix
    ../../modules/desktop/gnome-rice.nix
  ];

  home.username = "nael";
  home.homeDirectory = "/home/nael";

  home.stateVersion = "25.11";

  # General GUI Apps
  home.packages = with pkgs; [
    mission-center
    # The Nix tools you need for Zed to work
    nixd
    nixpkgs-fmt
  ];

  programs.lutris.enable = true;
  programs.home-manager.enable = true;
  xdg.enable = true;
}
