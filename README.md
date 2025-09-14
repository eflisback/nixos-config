# NixOS Configuration

Ebbe's NixOS configuration using Flakes and Home-Manager for declarative system and user environment management.

## How It Works

**NixOS vs Home-Manager:**
- **NixOS** (`configuration.nix`): System-wide settings (services, bootloader, networking, system packages)
- **Home-Manager** (`home.nix`): User-specific settings (dotfiles, user applications, shell config)

**Flakes & Versioning:**
- `flake.nix` defines inputs (nixpkgs version) and system configuration
- `flake.lock` locks package versions for reproducibility
- Updates happen explicitly via `nix flake update`, not automatically

## Structure

```
├── flake.nix                   # Main flake with inputs and system config
├── configuration.nix           # System-wide NixOS config  
├── home.nix                    # Home-Manager entry point
├── hardware-configuration.nix  # Auto-generated hardware config
└── modules/
    ├── system/                 # System-level modules
    │   └── desktop.nix         # Desktop environment, audio, printing
    └── home/                   # User-level modules  
        ├── shell.nix           # Zsh, aliases, fonts, shell tools
        ├── development.nix     # Dev tools (languages, editors, git)
        └── apps.nix            # User applications (Discord, etc.)
```

## Essential Commands

### System Management
```bash
# Apply system changes (requires sudo)
sudo nixos-rebuild switch --flake .#nixos

# Apply user environment changes (no sudo)
home-manager switch --flake .#ebbe

# Test system config without switching
sudo nixos-rebuild test --flake .#nixos
```

### Package Management
```bash
# Search for packages
nix search nixpkgs <package-name>

# Check current package version
nix eval nixpkgs#<package>.version

# Update all packages to latest versions
nix flake update
# Then rebuild system and home
sudo nixos-rebuild switch --flake .#nixos
home-manager switch --flake .#ebbe
```

### Adding Packages
- **System packages** (available to all users): Add to `configuration.nix` or `modules/system/`
- **User packages** (your personal tools): Add to relevant module in `modules/home/`
- **Development tools**: `modules/home/development.nix`
- **Applications**: `modules/home/apps.nix` 
- **Shell tools**: `modules/home/shell.nix`

### Flake Operations
```bash
# Show flake info
nix flake show

# Update specific input only
nix flake lock --update-input nixpkgs

# Check flake for issues
nix flake check
```

### Generation Cleanup
```bash
# List system generations (shows boot menu entries)
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

# List user environment generations
nix-env --list-generations

# Keep last 5 system generations, delete older ones
sudo nix-env --delete-generations +5 --profile /nix/var/nix/profiles/system

# Delete specific generation by number
sudo nix-env --delete-generations 42 --profile /nix/var/nix/profiles/system

# Delete old user generations
nix-env --delete-generations old

# Clean up unreferenced packages from nix store
sudo nix-collect-garbage

# Full cleanup (removes ALL old generations and unused packages)
sudo nix-collect-garbage -d
```

## Workflow Examples

**Adding a new development tool:**
1. Edit `modules/home/development.nix`, add package to `home.packages`
2. Run `home-manager switch --flake .#ebbe`

**System configuration change:**
1. Edit `configuration.nix` or system module
2. Run `sudo nixos-rebuild switch --flake .#nixos`

**Getting latest package versions:**
1. Run `nix flake update` 
2. Rebuild both: `sudo nixos-rebuild switch --flake .#nixos && home-manager switch --flake .#ebbe`

## Current Setup
- **Host**: orbit
- **Desktop**: GNOME with GDM
- **Shell**: Zsh with Oh-My-Zsh
- **Editor**: VSCode with Nix formatting support
- **Languages**: Scala, Java (OpenJDK), Nix
- **Fonts**: Nerd Fonts (Fira Code, JetBrains Mono), Font Awesome