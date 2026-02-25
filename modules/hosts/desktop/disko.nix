{
    disko.devices = {
        disk = {
            primary = {
                type = "disk";
                device = "/dev/disk/by-uuid/164b2e71-1360-4ba3-a82f-b0bc37f93ffd";
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
                            size = "32G";
                            content = {
                                type = "swap";
								# compatible for using both?
								# probably have to decide
								# if going with random, might aswell use swap file
                                randomEncryption = true;
                                resumeDevice = true;
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
                                    # keyFile = "/tmp/secret.key"; # Using a key file
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
								name = "cryptsecond";
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
}
