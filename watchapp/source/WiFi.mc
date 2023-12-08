using Toybox.Communications as Comm;
using Toybox.System as Sys;

class wifiScan {
    var wifiStatus = true;
    var errorCode;
    
    function initialize() {
        System.println("initialize() called: wifiStatus=" + wifiStatus);
    }

    //1st iteration: returns true
    //updates: returns wifiAvaialable
    /*function isWifi(){
        if (wifiStatus){
            return true;
        }
    }*/

    //1st iteration: returns true
    //updates: returns wifiAvailable
    function getStatus(){
        return wifiStatus;
    }

    //Use to get the Errorcode when there's no Wifi available
    function getError(){
        return errorCode;
        //System.println("Error: " + errorCode);
    }

    function checkWifiConnection() {
        Comm.checkWifiConnection(method(:onWifiConnectionStatus));
        System.println("checkWifiConnection() called");
    }

    // Callback method for checkWifiConnection
    function onWifiConnectionStatus(result) {
        wifiStatus = result[:wifiAvailable];
        errorCode = result[:errorCode];
        System.println("onWifiConnectionStatus() called: wifiAvailable=" + wifiStatus);
    }

}