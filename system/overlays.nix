{
  nixpkgs.overlays = [
    # Upstream retagged nanoemoji v0.16.0, so the hash pinned in the current
    # nixos-unstable snapshot no longer matches. This breaks jetbrains-mono
    # (built from source via gftools -> nanoemoji).
    # Fixed in nixpkgs 1e544d5f3944; drop this once the channel includes it.
    (final: prev: {
      python313Packages = prev.python313Packages.overrideScope (
        pyFinal: pyPrev: {
          nanoemoji = pyPrev.nanoemoji.overrideAttrs (old: {
            src = prev.fetchFromGitHub {
              owner = "googlefonts";
              repo = "nanoemoji";
              tag = "v${old.version}";
              hash = "sha256-FysyKC01XBnRiur5RR9fcsTxQqE8x0JJHSoe3q6JtKc=";
            };
          });
        }
      );
    })
  ];
}
