{ ... }: {
	flake.homeModules.hyprland = { pkgs, config, ... }: {
		home.packages = with pkgs; [
			hyprland
		];

		home.file.".config/hypr".source = config.lib.file.mkOutOfStoreSymlink ./../../dotfiles/hyprland;
	};
}
