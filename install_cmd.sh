# disko=github:nix-community/disko/latest#disko-install
# experimental=--extra-experimental-features "nix-command flakes"
sudo nix run github:nix-community/disko/latest#disko-install --extra-experimental-features "nix-command flakes" -- --write-efi-boot-entries --flake flake.nix#<flake_attribute> --disk primary /dev/vda
# sudo nix run $disko $experimental -- --write-efi-boot-entries --flake flake.nix#matoo-vm --disk primary /dev/vda
# sudo nix run $disko $experimental -- --write-efi-boot-entries --flake flake.nix#matoo-laptop --disk primary /dev/nvme0n1
# sudo nix run $disko $experimental -- --write-efi-boot-entries --flake flake.nix#matoo-desktop --disk primary /dev/nvme0n1 --disk secondary /dev/nvme1n1 --disk tertiary /dev/sda
