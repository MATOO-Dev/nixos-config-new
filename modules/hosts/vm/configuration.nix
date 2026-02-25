{ inputs, self, ... }:
{
    flake.nixosConfigurations.matoo-vm = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixosModules.matoo-vm
        ];
    };

    flake.nixosModules.matoo-vm =
        { pkgs, ... }:
        {
            imports = [
                # general
				# self.nixosModules.general
				# self.nixosModules.gnome

                # vm specific
                self.nixosModules.vm-hardware

                # disko
                inputs.disko.nixosModules.disko
                self.diskoConfigurations.matoo-vm
            ];

            boot = {
                loader.systemd-boot.enable = true;
                loader.efi.canTouchEfiVariables = true;
            };

			networking.hostName = "matoo-vm";

			networking.networkmanager.enable = true;

			services.xserver.enable = true;

			services.displayManager.ly.enable = true;

			users.users.matoo = {
				isNormalUser = true;
				description = "MATOO";
				extraGroups = [
					"networkmanager"
					"wheel"
				];
				# only used once right after installing
				initialPassword = "12345";
			};

			# gnome
			services.desktopManager.gnome.enable = true;

			# niri
			programs.niri.enable = true;
			security.polkit.enable = true;
			services.gnome.gnome-keyring.enable = true;
			security.pam.services.swaylock = {};
			programs.waybar.enable = true;
			environment.systemPackages = with pkgs; [
				alacritty
				fuzzel
				swaylock
				mako
				swayidle
			];

            system.stateVersion = "25.11";
        };
}
