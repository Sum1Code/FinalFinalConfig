{ pkgs, ... }:

{
  imports = [
    ../modules/home/shell.nix
    ../modules/home/desktop/gnome-rice.nix
    ./home-packages.nix
  ];

  home.username = "nael";
  home.homeDirectory = "/home/nael";

  home.stateVersion = "25.11";


  programs.lutris.enable = true;
  programs.home-manager.enable = true;
  xdg.enable = true;
}
