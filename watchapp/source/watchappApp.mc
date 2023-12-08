import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
using Toybox.Communications as Comm;

class watchappApp extends Application.AppBase {
    
    //var wifi = new wifiScan();
    //var gps = new GPS();
    //var myTimer = new Timer.Timer();

    function initialize() {
        AppBase.initialize();
        myTimer.start(method(:onTimerTick), 1000, true);
    }
 
    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        var enable = gps.enableLocation();

    }
    
    function onTimerTick() {
        var acc = gps.getLocation();
        var timestamp = gps.timeStamp();
        System.println("Coordinates: " + acc + " Timestamp: " + timestamp);
    }

    /*function onTimerTick() {
        wifi.checkWifiConnection(); // Call this method periodically
        var wifiAvailable = wifi.getStatus();
        System.println("WiFi Available: " + wifiAvailable);
    }*/

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new watchappView(), new watchappDelegate() ] as Array<Views or InputDelegates>;
    }

}

function getApp() as watchappApp {
    return Application.getApp() as watchappApp;
}

