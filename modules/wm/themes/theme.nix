{ pkgs , ... }:
let
  callPackage = pkgs.callPackage;
in {
  nixpkgs.overlays = [(final: prev: {
    mypackages = {
      gtk-theme = callPackage ./theme-obsidian-2/Obsidian-2/gtk-3.0/gtk.css {};
    };
  })];
}

