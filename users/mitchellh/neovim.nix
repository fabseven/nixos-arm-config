{ pkgs, config, ...}: {
	home.packages = with pkgs; [
		prettierd
	];

	#Use external directory for neovim
	home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink
		"${config.home.homeDirectory}/nixos-arm-config/nvim";
}
