{ pkgs , ... }:
{
  programs.nix-ld = 
  {
    enable = true;
    libraries = with pkgs;
    [
      libX11.so6
    ];
  };

}
