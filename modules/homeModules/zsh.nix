{ ... }: {
	flake.homeModules.zsh = { pkgs, ... }: {
		programs.zsh = {
			enable = true;

			shellAliases = {
				open = "xdg-open";
				ls = "ls --color";
				# clear = "printf '\033[2J\033[3J\033[1;1H'";
			};

			enableCompletion = true;
			syntaxHighlighting.enable = true;

			history = {
				size = 10000;
				share = true;
				ignoreDups = true;
				ignoreAllDups = true;
			};

			historySubstringSearch.enable = true;

			initExtra = ''
				zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
				zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
			'';

			plugins = [
				{
					name = "zsh-autosuggestions";
					src = pkgs.zsh-autosuggestions;
					file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
				}
			];
		};

		programs.zozide = {
			enable = true;
			enableZshIntegration = true;
			options = [ "--cmd j" ];
		};
	};
}
