{} : {


  environment.systemPackages = with pkgs;
    import ../nixos-modules/packages/sys-packages.nix {
      inherit pkgs;
      inherit inputs;
    };
}