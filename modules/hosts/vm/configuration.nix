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

                # desktop specific
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

			networking.networkmanager.enable = "true";

			services.xserver.enable = "true";

            system.stateVersion = "25.11";
        };
}
