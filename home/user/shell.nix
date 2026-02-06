{ config, pkgs, ... }:

{
  # Zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      update = "cd ~/nixos-config && sudo nix flake update";
      config = "codium ~/nixos-config 2>/dev/null";
      sdn = "shutdown -h now";
      rbt = "reboot";

      ls = "eza --icons always";
      ll = "eza -bhl --icons --group-directories-first";
      la = "eza -abhl --icons --group-directories-first";
      lt = "eza --tree --level=2 --icons";

      code = "codium 2>/dev/null";
    };

    initContent = ''
      eval "$(zoxide init zsh)"

      rebuild() {
        sudo nixos-rebuild "$1" --flake "$2"
      }
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
      theme = "robbyrussell";
    };
  };

  # Shell tools
  home.packages = with pkgs; [
    zoxide
    eza
  ];
}
