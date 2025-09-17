# NixOS Configuration

A modular NixOS configuration using Flakes and Home-Manager with support for multiple hosts.

## Structure

```
nixos-config/
├── flake.nix                    # Main flake definition
├── hosts/                      # Host-specific configurations
│   └── nucleus/                # Desktop configuration
│       ├── default.nix         # System config for nucleus
│       ├── hardware-configuration.nix
│       └── home.nix            # Home-Manager config for nucleus
├── system/                     # Shared system configuration
│   ├── common.nix              # Common system settings
│   └── modules/                # Modular system components
│       ├── boot.nix            # Bootloader configuration
│       ├── networking.nix      # Network settings
│       ├── packages.nix        # System packages
│       ├── hardware.nix        # Shared hardware settings
│       └── ...                 # Other system modules
└── home/                       # Shared user configuration
    ├── common.nix              # Common home settings
    ├── user/                   # Home-Manager modules
    │   ├── packages.nix        # User packages
    │   ├── programs.nix        # Application configs
    │   ├── desktop/            # Desktop environment configs
    │   │   ├── hyprland.nix    # Hyprland configuration
    │   │   └── hyprpaper.nix   # Wallpaper configuration
    │   └── ...                 # Other user modules
    └── config/                 # Traditional dotfiles
```

## Usage

### System Management

```bash
# Apply system configuration for nucleus (Desktop host)
sudo nixos-rebuild switch --flake .#nucleus

# Test configuration without switching
sudo nixos-rebuild test --flake .#nucleus

# Check flake for issues
nix flake check
```

### Package Management

```bash
# Search for packages
nix search nixpkgs <package-name>

# Update all packages
nix flake update
sudo nixos-rebuild switch --flake .#nucleus

# Update specific input
nix flake lock --update-input nixpkgs
```

### Generation Management

```bash
# List system generations
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

# Delete old generations (keep last 5)
sudo nix-env --delete-generations +5 --profile /nix/var/nix/profiles/system

# Clean up nix store
sudo nix-collect-garbage -d
```

## Adding New Hosts

1. Create new host directory:
   ```bash
   mkdir hosts/laptop
   ```

2. Copy hardware configuration:
   ```bash
   nixos-generate-config --dir hosts/laptop
   ```

3. Create `hosts/laptop/default.nix`:
   ```nix
   { config, pkgs, ... }:
   {
     imports = [
       ./hardware-configuration.nix
       ../../system/common.nix
     ];
     
     networking.hostName = "laptop";
     # Laptop-specific system settings
   }
   ```

4. Create `hosts/laptop/home.nix`:
   ```nix
   { inputs, pkgs, ... }:
   {
     imports = [ ../../home/common.nix ];
     
     # Laptop-specific home settings
     wayland.windowManager.hyprland.settings = {
       monitor = [ "eDP-1,1920x1200@60,0x0,1.0" ];
     };
   }
   ```

5. Add to `flake.nix`:
   ```nix
   nixosConfigurations.laptop = lib.nixosSystem {
     # ... similar to nucleus config
   };
   ```

## Configuration Changes

### System-wide Changes
Edit files in `system/modules/` then rebuild:
```bash
sudo nixos-rebuild switch --flake .#nucleus
```

### User Environment Changes
Edit files in `home/user/` then rebuild:
```bash
sudo nixos-rebuild switch --flake .#nucleus
```

### Host-specific Changes
Edit files in `hosts/*/` then rebuild for that host:
```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

## Key Features

- **Host-specific configurations**: Easy to manage different settings per machine
- **Modular design**: Shared modules with host-specific overrides
- **Integrated Home-Manager**: User configurations managed through system rebuild
- **No direct home-manager command needed**: Everything managed through `nixos-rebuild`

## Current Setup

- **Hosts**: nucleus (desktop), orbit (laptop)
- **Desktop Environment**: Hyprland with Waybar
- **Shell**: Zsh with Oh-My-Zsh
- **Terminal**: Kitty
- **User**: ebbe
- **State Version**: 25.05