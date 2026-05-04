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
}
