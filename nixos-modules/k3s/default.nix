{
  cluster-details,
  lib,
  cuttlefish,
  briefing-site,
  hostName,
  ...
}:
{


          cuttlefish = {
            details = cluster-details;
            tokenFile = "/etc/secrets/cf-serToken";
	    briefing.src = briefing-site;
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
