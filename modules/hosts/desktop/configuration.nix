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
                self.nixosModules.desktop

                # disko
                inputs.disko.nixosModules.disko
                self.diskoConfigurations.matoo-desktop
            ];

            boot = {
                loader.grub.enable = true;
                loader.grub.efiSupport = true;
                loader.grub.efiInstallAsRemovable = true;
            };

            system.stateVersion = "25.11";
        };
}
