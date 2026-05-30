{ pkgs, ... }: {

  virtualisation.virtualbox.host.enableKvm = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  virtualisation.virtualbox.host.enable = true;

  virtualisation.virtualbox.host.addNetworkInterface = false;
  users.users."nael".extraGroups = [ "libvirtd" "vboxusers" ];

  environment.systemPackages = with pkgs; [
    dnsmasq
  ];
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  virtualisation.waydroid.enable = true;

  # Useful for running non-nixos binaries (VS Code, Docker binaries, etc.)
  programs.nix-ld.enable = true;
}
