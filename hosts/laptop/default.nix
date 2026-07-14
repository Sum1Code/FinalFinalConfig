# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./asus.nix
      ./overlay.nix
      ./nvf.nix
      ../../users/nael
      ../../modules/nixos
    ];

  #
  # Host identification
  networking.hostName = "vrss";

  programs.zsh.enable = true;

  # System-wide packages
  environment.systemPackages = with pkgs; [
    wget
    zed-editor
    docker-compose
    man-pages
    man-pages-posix

  ];
  documentation.dev.enable = true;
  # Desktop Setting
  system.desktop.gnome.enable = true;
  system.apps.steam.enable = true;

  # Nix Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.nael = import ../../users/nael/home.nix;
  };
}
