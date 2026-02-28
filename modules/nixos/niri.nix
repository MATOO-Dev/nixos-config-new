{ ... }: {
	flake.nixosModules.niri = { pkgs, ... }: {
		programs.niri.enable = true;
		security.polkit.enable = true;
		services.gnome.gnome-keyring.enable = true;
		security.pam.services.swaylock = {};
		programs.waybar.enable = true;

		services.xserver.enable = true;

		environment.systemPackages = with pkgs; [
			alacritty
			fuzzel
			swaylock
			mako
			swayidle
		];
	};
}
