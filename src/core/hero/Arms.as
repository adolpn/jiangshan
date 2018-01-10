package core.hero {
import data.Data;

import flash.display.Sprite;
import flash.events.Event;
import flash.display.Loader;
import flash.net.URLRequest;

public class Arms extends Sprite{
    private var _img:Loader;
    private var _w:int =100;
    private var _h:int = 100;
    private var _arms:Array =[];
    private var _currentArm:Object;
    private var _currentArmID:int =0;
    public function Arms(w:int =100,h:int=100) {
        _w = w;
        _h = h;
        init();
        /*if(stage)
        {
            init();
        }else
        {
            this.addEventListener(Event.ADDED_TO_STAGE,addtoStage);
        }*/
    }
    //
    private function addtoStage(e:Event):void
    {
        this.removeEventListener(Event.ADDED_TO_STAGE,addtoStage);
        init();
    }
    //
    protected function init():void
    {
        _img = new Loader();
        addChild(_img);
    }
    //设置出场兵种
    public function setCurrentArm(id:int =0):void
    {
        _currentArmID = id;
        _currentArm =_arms[id];
        //{"type":1,"index":"gongjianshou","name":"gongjianshou","url":"images/hero/1.png","id":0}
        _img.contentLoaderInfo.addEventListener(Event.COMPLETE,imgLoadedHandle);
        _img.load(new URLRequest(_currentArm.url));
    }
    //设置拥有兵种(三个兵种)
    public function setArms(arm:Array):void
    {

        //arm1参数 形式为[[1,"gongjianshou"],[],[]]
        for(var i:int =0;i<arm.length;i++)
        {
            _arms.push(arm[i]);
           /* var armType:int =arm[0][0];
            var armIndex:String =arm[0][1];
            _arms.push(Data[armType][armIndex]);*/
        }

    }
    //
    private function imgLoadedHandle(e:Event):void
    {
        _img.contentLoaderInfo.removeEventListener(Event.COMPLETE,imgLoadedHandle);
        _img.width =_w;
        _img.height =_h;
    }

}
}
