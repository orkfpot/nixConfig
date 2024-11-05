{
  networking = {
#    can't have networking.networkmanager + networking+wireless
#    networkmanager.enable = true;
    nameservers = [ "9.9.9.9" ];
    wireless = {
      enable = true;
      environmentFile = "/root/wireless.env";
      interfaces = ["wlo1"];
      userControlled.enable = true;
      networks = {
        "SSE Broadband E9C323" = {
	  psk = "gek97MbPTY2fHZL7";
	};
	"Anthony" = {
	  psk = "iat2umx3";
        };
	"LAMM Space" = {
	};
	"ASK4 Wireles" = {
	};
	"ASK4 Wireles (802.1x)" = {
	};
	eduroam = {
	  auth = ''
	    key_mgmt=WPA-EAP
	    eap=PEAP
	    identity="spudulis@lancaster.ac.uk"
	    password="@PASS_EDUROAM@"
	    '';
	};
      };
    };
  };
}
