{ config , lib , pkgs , ... }:

{
  environment.systemPackages = with pkgs;
  [
    davinci-resolve
  ];
  hardware.graphics =
  {
    extraPackages = with pkgs;
    [
      rocmPackages.clr.icd
    ];
  };
}
