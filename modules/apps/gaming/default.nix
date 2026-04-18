{lib, ...}: {
  imports = [
    ./steam.nix
  ];

  options.apps = {
    steam.enable = lib.mkEnableOption "steam";
  };

}
