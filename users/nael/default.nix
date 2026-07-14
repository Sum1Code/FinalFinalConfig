{ pkgs, ... }:
{
  users.users.nael = {
    isNormalUser = true;
    description = "nael";
    extraGroups = [ "networkmanager" "wheel" "video" "input" "docker" ];
    shell = pkgs.zsh;
  };
  environment.variables.LD_LIBRARY_PATH = "${pkgs.libGL}/lib:${pkgs.gtk3}/lib:${pkgs.glib.out}/lib:${pkgs.xorg.libXtst}/lib:${pkgs.libx11}/lib";
}
