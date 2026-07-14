{ pkgs, ... }: {

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu;
      runAsRoot = true;
      swtpm.enable = true; # Needed if you plan to use Windows 11/TPM
    };
  };

  programs.virt-manager.enable = true;

  networking.firewall.trustedInterfaces = [ "virbr0" ];
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
