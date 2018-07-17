package {


import flash.display.Sprite;
import flash.events.Event;

import view.Battlefield;
import control.attack.AttackControl;
import data.Data;
[SWF(width=1000, height=700)]
public class Main extends Sprite{
    private var _battlefield:Battlefield;
    private var _attackControl:AttackControl;
    public function Main() {
        if(stage)
        {
            init();
        }else
        {
            this.addEventListener(Event.ADDED_TO_STAGE,addtoStage);
        }
    }
    //
    private function addtoStage(e:Event):void
    {
        trace("111");
        this.removeEventListener(Event.ADDED_TO_STAGE,addtoStage);
        init();
    }
    //
    private function init():void
    {
        Data.initArmData();
        _battlefield = new Battlefield();
        addChild(_battlefield);
        _attackControl = new AttackControl(_battlefield);

    }
}
}
