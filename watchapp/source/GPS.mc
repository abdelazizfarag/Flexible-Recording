import Toybox.Position;
using Toybox.System;
using Toybox.Time.Gregorian;
using Toybox.Lang;


class GPS{

    var options = {};
    var posInfo; //info object in callback method
    var accuracy;
    var location; 

    var time;
    var timestamp;
    function initialize(){
        System.println("Initialize is called");
    }

    //Turn GPS on with constellations and configs
    function enableLocation() {
        if (Position has :hasConfigurationSupport) {
            if ((Position has :CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1_L5) &&
            (Position.hasConfigurationSupport(Position.CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1_L5))) {
                options[:configuration] = Position.CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1_L5;
            } else if ((Position has :CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1) &&
          (Position.hasConfigurationSupport(Position.CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1))) {
                options[:configuration] = Position.CONFIGURATION_GPS_GLONASS_GALILEO_BEIDOU_L1;
            } else if ((Position has :CONFIGURATION_GPS) &&  
            (Position.hasConfigurationSupport(Position.CONFIGURATION_GPS))) {
                options[:configuration] = Position.CONFIGURATION_GPS;
            }
        } else if (Position has :CONSTELLATION_GLONASS) {
            // this can fail with InvalidValueException if combination is not supported by device
            options[:constellations] = [ Position.CONSTELLATION_GPS, Position.CONSTELLATION_GLONASS ];
        } 
        options[:acquisitionType] = Position.LOCATION_CONTINUOUS;

        //Starts the reciever, sends recieved info to onPosition
        Position.enableLocationEvents(options, method(:onPosition));
        System.println("enableLocationEvents is called");

        return true; //Use to check if location is enabled
    }

    function disableLocation(){
        Position.enableLocationEvents(Position.LOCATION_DISABLE, method(:onPosition));
    }
    
    //UNCALLABLE
    function onPosition(info) {
        System.println("onPosition is called" + info);
        posInfo = info;
    }
  
    function getAccuracy() {
        System.println("getAccuracy is called");
        if (posInfo != null){
            accuracy = posInfo.accuracy;
            return accuracy;
        }
    }
    
    //Gets last recieved position info
    function getLocation(){
        if (posInfo != null){
            location = posInfo.position.toDegrees();
            return location;
        }
    }

    function timeStamp(){
        if (posInfo != null){
            //Get location time
            time = posInfo.when;
            timestamp = Gregorian.info(time, Time.FORMAT_SHORT);
            var formattedTime = Lang.format("$1$:$2$:$3$", [
            timestamp.hour.format("%02u"), 
            timestamp.min.format("%02u"),
            timestamp.sec.format("%02u")
            ]);
            return formattedTime;
        }
    }
}

/*-------------------------------------------------------------------------------------------------
HOW TO USE:
1- instantiate -> new GPS();
2- call enableLocation();
3- Use any function
---------------------------------------------------------------------------------------------------*/