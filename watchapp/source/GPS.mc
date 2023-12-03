import Toybox.Position;
using Toybox.System;
using Toybox.Time.Gregorian;
using Toybox.Lang;


class GPSQuality{
    var options = {};
    var info;

    function initialize(){
    
    }

    //Turn GPS on with constellations and configs
    function startPositioning() {
        System.println("StartPositioning is called");
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

        Position.enableLocationEvents(options, method(:onPosition));
        System.println("enableLocationEvents is called");
    }
    
    function onPosition(newInfo) {
        info = newInfo;
        System.println("onPosition is called");
    }

    function getAccuracy() {
        System.println("getAccuracy is called");
        var accuracy = info.accuracy;
        return accuracy;
    }
}