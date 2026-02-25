{
    disko.devices = {
        disk = {
            primary = {
                type = "disk";
                device = "/dev/disk/by-uuid/1980-01-01-00-00-00-00";
                content = {
                    type = "gpt";
                    partitions = {
                        boot = {
                            name = "boot";
                            size = "1M";
                            type = "EF02";
                        };
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
                                randomEncryption = true;
                                resumeDevice = false;
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
                                    allowDiscards = true;
                                    # keyFile = "/tmp/secret.key";
                                };
                                content = {
                                    type = "btrfs";
                                    extraArgs = [
                                        "-f"
                                    ];
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
}
