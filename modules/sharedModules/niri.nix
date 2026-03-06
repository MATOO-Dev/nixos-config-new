{ ... }: {
	flake.nixosModules.niri = { pkgs, ... }: {
		programs = {
			niri.enable = true;
		};

		services = {
			gnome.gnome-keyring.enable = true;
			xserver.enable = true;
		};

		security = {
			polkit.enable = true;
		};

		environment.systemPackages = with pkgs; [
			# notifications
			mako
		];
	};

	flake.homeModules.niri = { pkgs, config, ... }: {
		home.packages = with pkgs; [
			niri
		];

		home.file.".config/niri".source = config.lib.file.mkOutOfStoreSymlink ./../../dotfiles/niri;
	};
}
