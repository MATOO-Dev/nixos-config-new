{ inputs, self, ... }:
{
    flake.nixosConfigurations.matoo-vm = inputs.nixpkgs.lib.nixosSystem {
        modules = [
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

			# hardware
			self.nixosModules.vm-general
			self.nixosModules.vm-hardware
			inputs.disko.nixosModules.disko
			self.diskoConfigurations.matoo-vm
        ];
    };

    flake.nixosModules.vm-general = { pkgs, ... }:
	{
		networking.hostName = "matoo-vm";

		environment.systemPackages = with pkgs; [
			git
			vim
		];

		system.stateVersion = "25.11";
	};

	flake.homeConfigurations.matoo = inputs.home-manager.lib.homeManagerConfiguration {
		pkgs = inputs.nixpkgs;
		modules = [
			inputs.home-manager.flakeModules.home-manager
			self.homeModules.matoo-home
		];

		home.stateVersion = "25.11";
	};

	flake.homeModules.matoo-home = { ... }:
	{
		imports = [
			self.homeModules.git
			# self.nixosModules.protonmail
		];

	};
}
