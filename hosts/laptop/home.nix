{ pkgs, ... }:

{
  imports = [
    ./shell.nix
    ../../modules/desktop/gnome/gnome-rice.nix
  ];

  home.username = "nael";
  home.homeDirectory = "/home/nael";

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    mission-center
    nixd
    nixpkgs-fmt
  ];

  programs.lutris.enable = true;
  programs.home-manager.enable = true;
  xdg.enable = true;
}
