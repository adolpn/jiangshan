package core.hero {
/**
 * 英雄基类
 */


import com.bit101.components.InputText;

//import core.arm.Arms;

import data.ActionAttribute;
import data.Data;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.events.Event;
import flash.display.Loader;
import flash.net.URLRequest;

import data.BaseAttribute;
import control.attack.AttackEventControl;
import core.events.AttackEvent;

public class Hero extends Sprite{
    protected var _w:int =126;
    protected var _h:int =105;
    private var _heroImgLoader:Loader;
    private var _arm:Arms;
    private var _armData:Object;
    private var _heroURL:String;
    private var _heroText:TextField;
    private var _lifeText:TextField;
    private var _heroName:String;
    protected var _id:int =0;//代表在战场的站位
    protected var brithPlace:int = 0;       //出生地  0蜀1吴2魏3群雄
    protected var _attribute:BaseAttribute;
    protected var _actionAttribute:ActionAttribute;
    private var _campType:int = 0;//英雄阵营
    protected var _resultData:Object;//攻击回馈属性
    public function Hero(attribute:BaseAttribute,armData:Object, _type:int=0) {
        _attribute =attribute;
        _armData = armData;
        _campType =_type;
        initData();
    }
    //
    protected function initData():void
    {
        _actionAttribute = new ActionAttribute();
        _actionAttribute.campType = _campType;
        //_heroURL = _attribute.heroURL;
        _heroName = _attribute.heroName;
        this.name =_heroName;
        init();
    }
    //
    protected function init():void
    {
        _arm = new Arms(_w,_h);
        //_arm.setArms([]);
        _arm.setArms(_armData.arms);
        _arm.setCurrentArm(_armData.currentID);
        addChild(_arm);
        _arm.y = 33;
        _heroImgLoader = new Loader();
        _heroImgLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,imgLoadedHandle);
        //_heroImgLoader.load(new URLRequest(_heroURL));

        _heroText = new TextField();
        _heroText.mouseEnabled = false;
        _heroText.width = _w;
       // _heroText.height =10;
        _heroText.text =_heroName;
        addChild(_heroText);

        _lifeText =new TextField();
        _lifeText.mouseEnabled =false;
        _lifeText.width = _w;
        // _heroText.height =10;
        _lifeText.y = 18;
        _lifeText.text = String(_attribute.life);
        trace(_lifeText.text);
        addChild(_lifeText);

        this.addEventListener(MouseEvent.CLICK,thisClickHandle);
        this.buttonMode = true;
        AttackEventControl.getInstance().addEventListener(AttackEvent.Attacked_Event,attackHandle);
    }
    //
    private function imgLoadedHandle(e:Event):void
    {
        _heroImgLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE,imgLoadedHandle);
        _heroImgLoader.width =_w;
        _heroImgLoader.height =_h;
        _heroImgLoader.y = 33;
        addChild(_heroImgLoader);
    }
    //攻击
    public function attack():void
    {
        if(_attribute.angerPoint <3)
        {
            //物理攻击
            _actionAttribute.attackType =0;
            _actionAttribute.attackTargetTypeName =ActionAttribute.attackTargetTypeData[1];//单一目标
        }else
        {
            //魔法攻击
            _actionAttribute.attackType =1;
            _actionAttribute.attackTargetTypeName =ActionAttribute.attackTargetTypeData[1];//单一目标
            _attribute.angerPoint =0;
        }
        _actionAttribute.campType =_campType;
        var attackEvent:AttackEvent = new AttackEvent(this,AttackEvent.Attacked_Event);
        AttackEventControl.getInstance().dispatchEvent(attackEvent);

    }
    //被攻击
    public function BeAttacked():void
    {

    }
    protected function shwoEffect():void
    {

    }

    //
    protected function thisClickHandle(e:MouseEvent):void
    {
        attack();
    }
    //
    protected function attackHandle(e:AttackEvent):void
    {
        if(e.dataObject.getAttribute.heroName !=_heroName)
        {

        }

    }
    //攻击回馈处理
    public function attackResult(resultData:Object):void
    {
        _resultData = resultData;
        if(_resultData.damageNum >0)
        {
            _attribute.angerPoint++;
            trace("怒气加一");
        }else
        {
            trace("攻击无效....");
        }
    }
    //被攻击处理
    public function beAttack(damageNum:int):void
    {
        _attribute.life = _attribute.life -damageNum;
        if(_attribute.life < 0)
        {
            _attribute.life =0;
            trace("英雄已经牺牲!!!!");
        }
        _lifeText.text = String(_attribute.life);
    }
    //获取英雄属性
    public function  get getAttribute():BaseAttribute
    {
        return _attribute;
    }
    //
    public function get getActionAttribute():ActionAttribute
    {
        return _actionAttribute;
    }
    //
    public function get getCampType():int
    {
        return _campType;
    }
    public function get getHeroID():int
    {
        return _id;
    }
    public function set setHeroID(id:int):void
    {
       _id = id;
    }
    //
    public function set myname(id:int):void
    {
        trace("jjjj")
    }

    //设置兵种数据
    protected function setArmObject(id:int=0,armName:String=""):Object
    {
        var obj:Object = Data.ArmsData[id];
        trace(Data.ArmsData[id]);
        var armobj:Object = Data.ArmsData[id][armName];
        return armobj;
    }
}
}
