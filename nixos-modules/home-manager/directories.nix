{inputs, lib, pkgs, config,  ... } : 

{
  options = {
    test = lib.mkOption {
      default = "default";
      type = lib.types.string;
      description = ''
        ghg
        '';
    };
  };

  
  config = 
    let 
      inputUser = config.test;

      validUser = lib.asserts.assertMsg (inputUser == "heifee" || inputUser == "ifeatud") "The user ${inputUser} is not valid";
    in 
    { 
    
      home.username = inputUser;
      home.homeDirectory = home/${inputUser};

    };
}