{config, pkgs, lib, ...}:
{

  programs.fish.enable = true;
  programs.fish.shellAliases = {
    hh = "home-manager switch --flake ~/dotnix/#mawio@wsl";
    cl = "clear";
    gg = "lazygit";
    alias = "nvim  ~/dotnix/modules/home-manager/fish.nix";
  };

}
