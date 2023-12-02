using Toybox.Communications as Comm;
using Toybox.System as Sys;

class wifiScan {
    var wifiStatus;
    var errorCode;

    function initialize() {
        checkWifiConnection();
    }

    function getStatus(){
        return wifiStatus;
        //System.println("Wifi connection unavailable");
    }

    function getError(){
        return errorCode;
        //System.println("Error: " + errorCode);
    }

    // Updated to use Garmin's API for Wi-Fi connection checking
    function checkWifiConnection() {
        Comm.checkWifiConnection(method(:onWifiConnectionStatus));
    }

    // Callback method for checkWifiConnection
    function onWifiConnectionStatus(result) {
        wifiStatus = result[:wifiAvailable];
        errorCode = result[:errorCode];
    }

}