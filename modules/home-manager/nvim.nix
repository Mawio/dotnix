{ config, pkgs, lib, ... }:
{
	programs.neovim = {
		enable = true;
		viAlias = true;
		vimAlias = true;
		plugins = with pkgs.vimPlugins; [
			nvim-cmp
			rose-pine
			nvim-autopairs
			telescope-nvim
			project-nvim
			];
		};

	xdg.configFile.nvim = {
		source = ../../config/nvim;
		recursive = true;
	};
}
