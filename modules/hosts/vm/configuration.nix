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
                self.nixosModules.vm

                # disko
                inputs.disko.nixosModules.disko
                self.diskoConfigurations.matoo-vm
            ];

            boot = {
                loader.grub.enable = true;
                loader.grub.efiSupport = true;
                loader.grub.efiInstallAsRemovable = true;
            };

            system.stateVersion = "25.11";
        };
}
