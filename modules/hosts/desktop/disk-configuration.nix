{
    flake.diskoConfigurations.matoo-desktop = {
        disko.devices = {
            disk = {
                primary = {
                    type = "disk";
                    device = "/dev/disk/by-uuid/164b2e71-1360-4ba3-a82f-b0bc37f93ffd";
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
                                size = "8G";
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
                                    passwordFile = "/tmp/secret.key"; # Interactive
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
                                            "/var/log" = {
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
                secondary = {
                    type = "disk";
                    device = "/dev/disk/by-uuid/497fc15d-d02f-416d-8e9b-d8ea53e7a7cb";
                    content = {
                        type = "gpt";
                        partitions = {
                            luks = {
                                size = "100%";
                                content = {
                                    type = "luks";
                                    name = "cryptsecond";
                                    # does this cache the interactive from primary
                                    # or will i need to enter this a second time
                                    # might be worth using an actual key file here
                                    passwordFile = "/tmp/secret.key"; # Interactive
                                    settings = {
                                        allowDiscards = true;
                                        keyFile = "/tmp/secret.key";
                                    };
                                    content = {
                                        type = "btrfs";
                                        extraArgs = [ "-f" ];
                                        subvolumes = {
                                            "/games" = {
                                                mountpoint = "/home/matoo/Games";
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
                # currently used for windows dual boot
                # havent used that in months though, might switch it over
                tertiary = {
                    type = "disk";
                    device = "/dev/disk/by-uuid/0F2F343744FB65A2";
                    content = {
                        type = "gpt";
                        partitions = {
                            luks = {
                                size = "100%";
                                content = {
                                    type = "luks";
                                    name = "cryptthird";
                                    # does this cache the interactive from primary
                                    # or will i need to enter this a second time
                                    # might be worth using an actual key file here
                                    passwordFile = "/tmp/secret.key"; # Interactive
                                    settings = {
                                        allowDiscards = true;
                                        keyFile = "/tmp/secret.key";
                                    };
                                    content = {
                                        type = "btrfs";
                                        extraArgs = [ "-f" ];
                                        subvolumes = {
                                            "/backups" = {
                                                mountpoint = "/home/matoo/Backups";
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
