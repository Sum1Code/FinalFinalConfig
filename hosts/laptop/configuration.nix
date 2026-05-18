# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./asus.nix
      ./overlay.nix

      ../../modules/core
      ../../modules/apps/virtualization.nix
      ../../modules/desktop
      ../../modules/apps/gaming
    ];

  #
  # Host identification
  networking.hostName = "vrss";

  programs.zsh.enable = true;
  users.users.nael = {
    isNormalUser = true;
    description = "nael";
    extraGroups = [ "networkmanager" "wheel" "video" "input" "docker" ];
    shell = pkgs.zsh;
  };

  # System-wide packages
  environment.systemPackages = with pkgs; [
    wget
    zed-editor
    docker-compose
  ];

  # Desktop Setting
  system.desktop.gnome.enable = true;
  apps.steam.enable = true;

  # Nix Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";
}
