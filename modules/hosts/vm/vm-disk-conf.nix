{
    flake.diskoConfigurations.matoo-vm = {
        disko.devices = {
            disk = {
                primary = {
                    type = "disk";
					# fix for out of space error that happens only in VMs
					imageSize = "10G";
                    device = "/dev/by-id/ata-QEMU_DVD-ROM_QM00005";
                    content = {
                        type = "gpt";
                        partitions = {
                            # apprently optional, esp is required
                            boot = {
                                name = "boot";
                                size = "1M";
                                type = "EF02";
                            };
                            # esp = efi system partition
                            esp = {
                                name = "ESP";
                                size = "1G";
                                type = "EF00";
                                content = {
                                    type = "filesystem";
                                    format = "vfat";
                                    mountpoint = "/boot";
                                };
                            };
                            encrypedSwap = {
                                size = "1G";
                                content = {
                                    type = "swap";
                                    # mutually exclusive options, decide on one
                                    # if going random, might use swap file instead
                                    # if going random, decrease size from 32G to 8G
                                    randomEncryption = true;
                                    # resumeDevice = true;
                                };
                            };
                            luks = {
                                size = "100%";
                                content = {
                                    type = "luks";
                                    name = "cryptroot";
                                    # disable settings.keyFile if you want to use interactive password entry
                                    # passwordFile = "/tmp/secret.key"; # Interactive
                                    settings = {
                                        # discard means unused blocks are zeroed
                                        # the data is still encrypted, but one can
                                        # see which parts & how much of the disk is used
                                        allowDiscards = true;
                                        # keyFile = "/tmp/secret.key"; # Using a key file
                                        # also appears to be deprecated?
                                    };
                                    # additionalKeyFiles = [ "/tmp/additionalSecret.key" ];
                                    content = {
                                        type = "btrfs";
                                        extraArgs = [ "-f" ];
                                        subvolumes = {
                                            "/root" = {
                                                mountpoint = "/";
                                                mountOptions = [
                                                    "compress=zstd"
                                                    "noatime"
                                                ];
                                            };
                                            "/home" = {
                                                mountpoint = "/home";
                                                mountOptions = [
                                                    "compress=zstd"
                                                    "noatime"
                                                ];
                                            };
                                            "/nix" = {
                                                mountpoint = "/nix";
                                                mountOptions = [
                                                    "compress=zstd"
                                                    "noatime"
                                                ];
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };
}
