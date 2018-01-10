package core.events {
import flash.events.Event;

public class AttackEvent extends Event {
    public static const BeAttacked_Event:String = "beattacked";//通用事件
    public static const Attacked_Event:String = "attacked";//通用数据事件
   public static const AttackedReslut_Event:String="attackedreslut";      //攻击回馈效果
    public var dataObject:Object;
    public function AttackEvent(_dataObject:Object =null,type:String=BeAttacked_Event, bubbles:Boolean = false, cancelable:Boolean = false) {
        dataObject =_dataObject;
        super(type, bubbles, cancelable);
    }
}
}
