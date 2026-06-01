{ pkgs, ... }:
{

  home.packages = with pkgs; [
    mission-center
    nixd
    nixpkgs-fmt
  ];
}
