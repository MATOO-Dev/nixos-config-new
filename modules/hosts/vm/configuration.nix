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

			# disabled temporarily
			services.xserver.enable = true;

			# vm specific stuff
			services.spice-vdagentd.enable = true;
			services.xserver.videoDrivers = ["virtio"];
			hardware.graphics.enable = true;

			users.users.matoo = {
				isNormalUser = true;
				description = "MATOO";
				extraGroups = [
					"networkmanager"
					"wheel"
				];
				# only used once right after installing
				# dont forget to set password
				initialPassword = "12345";
			};

			environment.systemPackages = with pkgs; [
				git
				vim
			];

            system.stateVersion = "25.11";
        };
}
