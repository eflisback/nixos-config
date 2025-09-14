{ config, pkgs, ... }:

{
  # Zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -la";
      la = "ls -A";
      l = "ls -CF";
      cd = "z";  # Use zoxide for cd
    };

    initExtra = ''
      eval "$(zoxide init zsh)"
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "robbyrussell";
    };
  };

  # Shell tools
  home.packages = with pkgs; [
    zoxide
    fzf
    ripgrep
    fd
  ];
}