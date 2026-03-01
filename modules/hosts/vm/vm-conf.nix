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
				self.nixosModules.general

				# system
				self.nixosModules.audio
				# self.nixosModules.bluetooth
				self.nixosModules.bootloader
				self.nixosModules.fonts
				self.nixosModules.input
				# self.nixosModules.kernel
				self.nixosModules.locale
				self.nixosModules.networking
				self.nixosModules.niri
				self.nixosModules.nix
				self.nixosModules.printing
				self.nixosModules.virtualization

				# home
				inputs.home-manager.flakeModules.home-manager
				# self.nixosModules.protonmail

                # hardware
				self.nixosModules.vm-hardware
                inputs.disko.nixosModules.disko
                self.diskoConfigurations.matoo-vm
            ];

			networking.hostName = "matoo-vm";

			environment.systemPackages = with pkgs; [
				git
				vim
			];

            system.stateVersion = "25.11";
        };
}
