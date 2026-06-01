{ config, ... }:
{
  networking.networkmanager.enable = true;
  networking.nftables.enable = true; # Modern alternative to iptables
}
