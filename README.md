# NixOS Configuration

Ebbe's NixOS configuration using Flakes and Home-Manager.

## Structure

```
├── flake.nix                   # Main flake configuration
├── configuration.nix           # System-wide NixOS config
├── home.nix                    # Home-Manager entry point
├── hardware-configuration.nix  # Hardware-specific config
└── modules/
    ├── system/                 # System-level modules
    │   └── desktop.nix         # Desktop environment, audio, etc.
    └── home/                   # User-level modules
        ├── shell.nix           # Zsh and shell tools
        ├── development.nix     # Dev tools and languages
        └── apps.nix            # User applications
```

## Usage

### First-time setup (on your laptop):
1. Enable flakes: `echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf`
2. Rebuild: `sudo nixos-rebuild switch --flake .#nixos`

### Regular updates:
- System: `sudo nixos-rebuild switch --flake .#nixos`
- User packages: `home-manager switch --flake .#ebbe`

### Add new packages:
- System packages: Edit `configuration.nix` or relevant system module
- User packages: Edit `modules/home/apps.nix` or relevant home module

## Future additions:
- Hyprland configuration
- More development environments
- Custom overlays