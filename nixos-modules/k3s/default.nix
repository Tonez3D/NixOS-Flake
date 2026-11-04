{
  cluster-details,
  lib,
  cuttlefish,
  hostName,
  ...
}:
{


          cuttlefish = {
            details = cluster-details;
            tokenFile = "/etc/secrets/cf-serToken";
            cygnus.enable = true;
            horus.enable = true;
	    tailscaleOperator = {
	      enable = true;
	      oauthEnvFile = "/etc/secrets/cuttlefish-tailscale.env";
	      cygnus.enable = true;
	      horus.enable = true;
	    };
                };

  
}
