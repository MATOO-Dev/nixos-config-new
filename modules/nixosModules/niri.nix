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
			# disabled because of vm
			# pam.services.swaylock = {};
			polkit.enable = true;
		};


		environment.systemPackages = with pkgs; [
			alacritty
			fuzzel
			swaylock
			mako
			swayidle
		];
	};
}
