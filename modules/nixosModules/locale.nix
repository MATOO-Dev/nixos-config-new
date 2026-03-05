{ ... }: {
	flake.nixosModules.locale = { ... }: {
		time.timeZone = "Europe/Berlin";

		# its i18n because 'internationalization' has 18 letters between i & n
		i18n = {
			defaultLocale = "en_US.UTF-8";

			extraLocaleSettings = { 
				# postal addresses
				LC_ADDRESS = "de_DE.UTF-8"; 
				# sorting and regular expressions
				LC_COLLATE = "de_DE.UTF-8"; 
				# single/multi byte characters, alphabetic/digit, etc.
				LC_CTYPE = "en_US.UTF-8"; 
				# documentation / country titles
				LC_IDENTIFICATION = "de_DE.UTF-8"; 
				# unit system (metric)
				LC_MEASUREMENT = "de_DE.UTF-8"; 
				# language for displayed messages (in C?)
				LC_MESSAGES = "en_US.UTF-8"; 
				# currency
				LC_MONETARY = "de_DE.UTF-8"; 
				# names for people (mr/mrs, etc)
				LC_NAME = "en_US.UTF-8"; 
				# number format, like dot/comma switch
				LC_NUMERIC = "en_US.UTF-8"; 
				# paper sizes
				LC_PAPER = "de_DE.UTF-8"; 
				# phone number prefixes etc
				LC_TELEPONE = "de_DE.UTF-8"; 
				# time formatting, like 12/24h
				LC_TIME = "en_GB.UTF-8"; 
			};
		};
	};
}
