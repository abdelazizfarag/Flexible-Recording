using Toybox.Communications as Comm;
using Toybox.System as Sys;

class wifiScan {
    var wifiStatus = false;
    var errorCode;
    var callbackMethod;
    
    function initialize() {
        System.println("initialize() called: wifiStatus=" + wifiStatus);
    }

    function getStatus(){
        System.println("getStatus() called: Returning wifiStatus=" + wifiStatus);
        return wifiStatus;
        //System.println("Wifi connection unavailable");
    }

    function getError(){
        return errorCode;
        //System.println("Error: " + errorCode);
    }

    // Updated to use Garmin's API for Wi-Fi connection checking
    function checkWifiConnection(methodObj) {
        callbackMethod = methodObj; // Store the Method object
        Comm.checkWifiConnection(method(:onWifiConnectionStatus));
        System.println("checkWifiConnection() called");
    }

    // Callback method for checkWifiConnection
    function onWifiConnectionStatus(result) {
        wifiStatus = result[:wifiAvailable];
        errorCode = result[:errorCode];
        System.println("onWifiConnectionStatus() called: wifiAvailable=" + wifiStatus);

                // Invoke the callback, if it exists
        if (callbackMethod != null) {
            callbackMethod.invoke(); // Invoke the callback method
        }

    }

}