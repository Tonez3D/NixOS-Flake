{pkgs, ...} : {
	imports = [
		./minikube.nix
		./nodes.nix
	];
	environment.systemPackages = with pkgs; [
		kubernetes
		docker	
	];
	virtualisation.docker.enable = true;
	services.kubernetes = {
		proxy = {
			enable = true;
			bindAddress = "0.0.0.0";

		};
	};
}
