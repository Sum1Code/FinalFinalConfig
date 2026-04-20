{ pkgs, ... }:

{
  home.packages = with pkgs; [
    htop
    fastfetch
  ];

  programs.git = {
    enable = true;
    userName = "lumahere";
    userEmail = "sum1hewe.dev@gmail.com";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    # Add syntax highlighting for a better ricing feel
    syntaxHighlighting.enable = true;
  };
}
