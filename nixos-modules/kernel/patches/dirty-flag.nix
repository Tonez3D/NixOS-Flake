{pkgs, lib, config, ...} : {
	boot.kernelPatches = [{
		name = "dirty-flag";
		patch = pkgs.fetchurl {
			url = "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/patch/?id=f4c50a4034e62ab75f1d5cdd191dd5f9c77fdff4";
        		hash = "sha256-j5l548aKMPIxfSfwy4hJadBvQN2kZsutpOVjLSXSk0A=";	
		};
	}];
}
