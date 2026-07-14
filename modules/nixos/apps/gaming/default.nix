{ lib, ... }: {
  imports = [
    ./steam.nix
  ];

  options.system.apps = {
    steam.enable = lib.mkEnableOption "steam";
  };

}
