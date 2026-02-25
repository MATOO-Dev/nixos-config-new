sudo nix run github:nix-community/disko/lastest#disko-install --extra-experimental-features "nix-command flakes" -- --write-efi-boot-entries --flake flake.nix#<flake_attribute>
