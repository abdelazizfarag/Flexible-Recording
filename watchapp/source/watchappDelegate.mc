import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Sensor;
using Toybox.Timer;


class watchappDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new watchappMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}