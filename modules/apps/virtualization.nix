{ pkgs, ... }: {

  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  };
  programs.virt-manager.enable = true;
  users.users."nael".extraGroups = [ "libvirtd" ];

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
