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
				self.nixosModules.bootloader
				self.nixosModules.general
				self.nixosModules.networking
				self.nixosModules.niri
				self.nixosModules.virtualization

                # vm specific
                self.nixosModules.vm-hardware

                # disko
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
