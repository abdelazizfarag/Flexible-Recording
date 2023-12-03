import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
using Toybox.Timer;
using Toybox.Activity;
using Toybox.Position as Position;

class watchappApp extends Application.AppBase {
    //var wifi = new wifiScan();
    var gps = new GPSQuality();
    function initialize() {
        AppBase.initialize();
    }
 
    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        //var callback = wifi.method(:getStatus);
        //wifi.checkWifiConnection(callback);
        gps.startPositioning();
        gps.getAccuracy();
    }

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

