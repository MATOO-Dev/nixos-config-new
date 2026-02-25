{
	flake.nixosModules.vm-hardware = { lib, modulesPath, ... }:{
		imports = [
			(modulesPath + "/profiles/quemu-guest.nix")
		];
		boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" ];
		boot.initrd.kernelModules = [ ];
		boot.kernelModules = [ "kvm-amd" ];
		boot.extraModulePackages = [ ];
		nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	};
}
