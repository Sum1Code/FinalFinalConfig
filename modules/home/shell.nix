{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    htop
    fastfetch
    nix-init
    starship
  ];


  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    # Add syntax highlighting for a better ricing feel
    syntaxHighlighting.enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    initContent = ''
      	export PATH="$PATH:$HOME/.cargo/bin"
        eval "$(starship init zsh)"
    '';
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/nael/sysconfig"; # sets NH_OS_FLAKE variable for you
  };
}
