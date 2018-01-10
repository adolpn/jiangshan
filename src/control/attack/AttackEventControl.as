package control.attack {
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

public class AttackEventControl extends EventDispatcher{
    private static var _instance:AttackEventControl;
    public function AttackEventControl() {

    }

    public static function getInstance():AttackEventControl
    {
        if(_instance ==null)
        {
            _instance = new AttackEventControl();
        }
        return _instance;
    }
}
}
