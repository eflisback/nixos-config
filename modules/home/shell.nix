{ config, pkgs, ... }:

{
  # Zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza --icons always";
      ll = "eza -bhl --icons --group-directories-first";
      la = "eza -abhl --icons --group-directories-first";
      lt = "eza --tree --level=2 --icons";
    };

    initContent = ''
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
    eza
  ];
}