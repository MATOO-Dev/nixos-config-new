{ ... }: {
	flake.nixosModules.fonts = { pkgs, lib, ... }: {
		fonts.packages = with pkgs; [ 
			# default font for nixos
			dejavu_fonts
			# clean sans font, good for typst
			paratype-pt-sans
			# default latex font
			newcomputermodern
			# default typst font
			libertinus
		]
		++
		builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
		# enable all nerd fonts
	};
}
