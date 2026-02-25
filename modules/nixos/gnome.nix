{ ... }: {
	flake.nixosModules.gnome = {pkgs, ...}: {
		services.displayManager.gdm.enable = true;
		services.desktopManager.gnome.enable = true;
		services.gnome.games.enable = false;
		environment.gnome.excludePackages = with pkgs; [
			gnome-tour
			gnome-user-docs
		];
	};
}
