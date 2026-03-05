{
    description = "MATOO's nixos config flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/25.11";
		# nixpkgs-unstable = {
		# 	url = "github:nixos/nixpkgs-unstable";
		# };
        flake-parts.url = "github:hercules-ci/flake-parts";
        import-tree.url = "github:vic/import-tree";
        disko = {
		    url = "github:nix-community/disko";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		# nvim = {
			# url = "github:matoo-dev/nixcats-config";
		    # inputs.nixpkgs.follows = "nixpkgs";
		# };
    };

    outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
