{ pkgs, ... }:
{

  home.packages = with pkgs; [
    mission-center
    nixd
    nixpkgs-fmt
    vscode-fhs
    (pkgs.jdk21.override { enableJavaFX = true; openjfx_jdk = pkgs.openjfx.override { withWebKit = true; }; })
    javaPackages.openjfx21
    libx11
    libxext
  ];
}
