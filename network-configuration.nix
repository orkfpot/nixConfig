{
  networking = {
    nameservers = ["9.9.9.9" "8.8.8.8"];
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
