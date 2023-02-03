{
  description = "Mawio's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager}: {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

    homeConfigurations = {
      "mawio@wsl" = home-manager.lib.homeManagerConfiguration rec {
	pkgs = import nixpkgs {
	  system = "x86_64-linux";
	  config.allowUnfree = true;
	};
	modules = [
	{
	  home.username = "mawio";
	  home.homeDirectory = "/home/mawio";
	  home.stateVersion = "22.11";
	  programs.home-manager.enable = true;

	  services.xcape.enable = true;
	  services.xcape.mapExpression = {
	    Control_L = "Escape";
	  };
	  programs.git.enable = true;
	  programs.lazygit.enable = true;

	}
	./modules/home-manager/nvim.nix
	./modules/home-manager/fish.nix
	./modules/home-manager/git.nix
	  ];
      };
      "mawio@desktop" = home-manager.lib.homeManagerConfiguration rec {
	pkgs = import nixpkgs {
	  system = "x86_64-linux";
	  config.allowUnfree = true;
	};
	modules = [
	{
	  home.username = "mawio";
	  home.homeDirectory = "/home/mawio";
	  home.stateVersion = "22.11";
	  programs.home-manager.enable = true;

	  services.xcape.enable = true;
	  services.xcape.mapExpression = {
	    Control_L = "Escape";
	  };
	  programs.lazygit.enable = true;
	}
	];
      };
    };
  };
}
