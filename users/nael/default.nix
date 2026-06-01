{ pkgs, ... }:
{
  users.users.nael = {
    isNormalUser = true;
    description = "nael";
    extraGroups = [ "networkmanager" "wheel" "video" "input" "docker" ];
    shell = pkgs.zsh;
  };
}
