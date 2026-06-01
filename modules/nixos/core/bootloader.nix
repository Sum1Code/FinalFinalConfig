{ pkgs, ... }:

{
  boot.loader = {
    # 1. Disable systemd-boot
    systemd-boot.enable = false;

    # 2. Configure GRUB
    grub = {
      enable = true;
      device = "nodev"; # Essential for EFI systems
      efiSupport = true;

      # If you want a specific font size for the GRUB menu
      fontSize = 24;
    };

    # 3. EFI settings
    efi.canTouchEfiVariables = true;
  };
}
