import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
using Toybox.Timer;
using Toybox.Activity;
using Toybox.Position as Position;

class watchappApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
        //Position.enableLocationEvents(Position.LOCATION_CONTINUOUS, method(:onPositionUpdate));
        //Position.enableLocationEvents( Position.LOCATION_CONTINUOUS, method(:onPosition) );
        //dataTimer.start(method(:onCheckQuality), 1000, true); // A one-second timer
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        //Position.enableLocationEvents(Position.LOCATION_CONTINUOUS, method(:onPosition));
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

