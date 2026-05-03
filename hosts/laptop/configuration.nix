# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix


      ../../modules/core
      ../../modules/desktop
      ../../modules/apps/gaming
    ];

  #
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "vrss"; # Define your hostname.

  # Enable CUPS to print documents.
  services.printing.enable = true;
  system.desktop.gnome.enable = true;
  services.asusd = {
    enable = true;
  };

  apps.steam.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nael = {
    isNormalUser = true;
    description = "nael";
    extraGroups = [ "networkmanager" "wheel" "video" "input" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      kdePackages.kate
      asusctl

      #  thunderbird
    ];
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.firefox.enable = true;
  programs.zsh.enable = true;
  nixpkgs.config.allowUnfree = true;

  programs.nix-ld.enable = true;
  environment.systemPackages = with pkgs; [
    wget
    zed-editor
    libsForQt5.qtstyleplugin-kvantum
    docker-compose
  ];
  networking.nftables.enable = true;
  virtualisation.docker.enable = true;
  # Optional: Enable rootless mode for better security
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };
  virtualisation.waydroid.enable = true;


  hardware.graphics = {
    enable = true;
  };

  services.flatpak.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = true;
    open = true;
    nvidiaSettings = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      nvidiaBusId = "PCI:1:0:0";
      intelBusId = "PCI:0:2:0";
    };

  };
  system.stateVersion = "25.11"; # Did you read the comment?
}
