{ inputs, self, ... }:
{
    flake.nixosConfigurations.matoo-desktop = inputs.nixpkgs.lib.nixosSystem {
        modules = [
            self.nixosModules.matoo-desktop
        ];
    };

    flake.nixosModules.matoo-desktop =
        { pkgs, ... }:
        {
            imports = [
                # general

                # desktop specific
                self.nixosModules.desktop-hardware

                # disko
                inputs.disko.nixosModules.disko
                self.diskoConfigurations.matoo-desktop
            ];

            boot = {
                loader.systemd-boot.enable = true;
                loader.efi.canTouchEfiVariables = true;
            };

			networking.hostName = "matoo-desktop";

			networking.networkmanager.enable = true;

			services.xserver.enable = true;

            system.stateVersion = "25.11";
        };
}
