{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    htop
    fastfetch
    nix-init
    starship
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "lumahere";
      user.email = "sum1hewe.dev@gmail.com";
    };

  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    # Add syntax highlighting for a better ricing feel
    syntaxHighlighting.enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    initContent = ''
      eval "$(starship init zsh)"
    '';
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };
}
