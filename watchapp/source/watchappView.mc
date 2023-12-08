import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Position;
import Toybox.Application;
using Toybox.System;
using Toybox.Time.Gregorian;
using Toybox.Communications;
using Toybox.Timer;
using Toybox.Ant;

class watchappView extends WatchUi.View {
    var options = {};


    hidden var posquality = null;
    hidden var progressDots = "";
    hidden var progressTimer = null;
    hidden var posInfo = null;
    hidden var wifi = null;
    hidden var errorCode;
    hidden var wifiStatus;
    hidden var location;
    hidden var locTop;
    hidden var locBot;
    hidden var time; 
    hidden var timestamp;
    hidden var gpsStatus = false;
    var signalStrength;

    var myTimer = new Timer.Timer();

    function initialize() {
        View.initialize();
        //myTimer.start(method(:checkConnection), 1000, true);
    }

    //Check connection to Wifi
    function checkConnection(){
        Communications.checkWifiConnection(method(:onWifiConnectionStatus));
        WatchUi.requestUpdate();
    }

    //Callback method for wifi connection status
    function onWifiConnectionStatus(wifi) {
        wifiStatus = wifi[:wifiAvailable];
        errorCode = wifi[:errorCode];
        return wifiStatus;
    }
    
    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // //Turn GPS on with constellations and configs
    // function startPositioning() {
    //     try {
    //         // this can fail with InvalidValueException if combination is not supported by device
    //         options[:constellations] = [Position.CONSTELLATION_GPS, Position.CONSTELLATION_GLONASS];
    //         options[:configuration] = Position.CONFIGURATION_GPS;
    //         options[:acquisitionType] = Position.LOCATION_CONTINUOUS;
    //     } catch (ex) {
    //         //System.println(false);
    //     }
    //     Position.enableLocationEvents(options, method(:onPosition));
        
    // }

    
    // function onPosition(info) {
    //     posInfo = info;
    //     System.println("onPosition view is called");
    // }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }
    

    // function initializeGPS() {
    //     if (gpsStatus == false){
    //         startPositioning();
    //         gpsStatus = true; 
    //         //System.println(gpsStatus);
    //     }
    // }

    // function checkGPSQuality() {
    //     posInfo = Position.getInfo();
    //     signalStrength = posInfo.accuracy;

    //     if (signalStrength == Position.QUALITY_GOOD || signalStrength == Position.QUALITY_USABLE){
    //         //System.println("User left the building");
    //         //Get location and parse it
    //         location = posInfo.position.toDegrees();
    //         locTop = location[0];
    //         locBot = location[1];

    //         //Get location time
    //         time = posInfo.when;
    //         timestamp = Gregorian.info(time, Time.FORMAT_SHORT);
    //         var formattedTime = Lang.format("$1$:$2$:$3$", [
    //         timestamp.hour.format("%02u"), 
    //         timestamp.min.format("%02u"),
    //         timestamp.sec.format("%02u")
    //         ]);
    //         }
    //     WatchUi.requestUpdate();
    // }

    // //Trigger method that turns on GPS when WiFi is out of range
    // function trigger(wifiStatus) {
    //     if (wifiStatus == false){
    //         //System.println("Wifi is out of range");
    //         initializeGPS();
    //         checkGPSQuality();

    //     }else if (wifiStatus == true){
    //         //System.println("Wifi available");
    //         gpsStatus = false;
    //     }

    // }



    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
    //     checkConnection();
    //     trigger(wifiStatus);
    //     //Get position and timestamp
        
    //     dc.setColor(Graphics.COLOR_TRANSPARENT, Graphics.COLOR_BLACK );
    //     dc.clear();

    //     var pos = 0;
        
    //     dc.setColor( Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT );
    //     pos = pos + Graphics.getFontHeight(Graphics.FONT_SMALL);
    //     dc.drawText( (dc.getWidth() / 2), pos, Graphics.FONT_MEDIUM, "Long: "+ locTop, Graphics.TEXT_JUSTIFY_CENTER );
    //     pos = pos + Graphics.getFontHeight(Graphics.FONT_MEDIUM);
    //     dc.drawText( (dc.getWidth() / 2), pos, Graphics.FONT_MEDIUM, "Lat: "+ locBot, Graphics.TEXT_JUSTIFY_CENTER );
    //     pos = pos + Graphics.getFontHeight(Graphics.FONT_MEDIUM);
    //     dc.drawText( (dc.getWidth() / 2), pos, Graphics.FONT_MEDIUM, "Strength: "+ signalStrength, Graphics.TEXT_JUSTIFY_CENTER );
    //     pos = pos + Graphics.getFontHeight(Graphics.FONT_MEDIUM);
    //     dc.setColor( Graphics.COLOR_BLUE, Graphics.COLOR_TRANSPARENT );
    //     dc.drawText( (dc.getWidth() / 2), pos, Graphics.FONT_MEDIUM, "Wifi: " + wifiStatus, Graphics.TEXT_JUSTIFY_CENTER );
    //     pos = pos + Graphics.getFontHeight(Graphics.FONT_MEDIUM);
    //     dc.drawText( (dc.getWidth() / 2), pos, Graphics.FONT_MEDIUM, "Error: " + errorCode, Graphics.TEXT_JUSTIFY_CENTER );
    // // Called when this View is removed from the screen. Save the
    // // state of this View here. This includes freeing resources from
    // // memory.
    }

    function onHide() as Void {
        Position.enableLocationEvents(Position.LOCATION_DISABLE, method(:onPosition));
    }
}