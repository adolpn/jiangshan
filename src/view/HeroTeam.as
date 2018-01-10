package view {
/**
 * 英雄团队 位置部署
 */

import core.hero.Hero;

import data.BaseAttribute;

import flash.display.Sprite;

import flash.display.Sprite;

import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Point;

public class HeroTeam extends Sprite {
    private var _heroWH:Point =new Point(20,30);
    private var _type:int =0;
    public function HeroTeam(type:int,p:Point) {
        _type = type;
        _heroWH =p;
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
        this.removeEventListener(Event.ADDED_TO_STAGE,addtoStage);
        init();
    }
    protected function init():void
    {
        for(var i:int =0;i<2;i++)
        {
            for(var j:int =0;j<3;j++)
            {
                var sp:Sprite =new Sprite();
                sp.name =String(i)+"_"+String(j);
                var spX:Number;
                var spY:Number;
                //阵营2的英雄位置布局不一样
                if(_type ==0)
                {
                    spX = _heroWH.x*j;
                    spY =_heroWH.y*i;
                }else
                {
                    spX = _heroWH.x*(2-j);
                    spY =_heroWH.y*(1-i);
                }
                sp.x =spX;
                sp.y = spY;
                this.addChild(sp);
            }

        }
    }
    public function addHero(_hero:Hero, _id:int=0):void
    {
        var spName:String =getHeroNameByID(_id);
        _hero.setHeroID = _id;

        var sp:Sprite = this.getChildByName(spName) as Sprite;
        while(sp.numChildren >0)
        {
            sp.removeChildAt(0);
        }
            sp.addChild(_hero);
        trace("添加第"+_id+"号英雄完成 名字为:"+spName);
    }
    //
    public function getHeroByID(id:int=0):Hero
    {
        var h:Hero = Sprite(this.getChildByName(getHeroNameByID(id))).getChildAt(0) as Hero;
        if(h !=null)
        {
            return h;
        }
        return null;
    }
    //
    private function getHeroNameByID(id:int =0):String
    {
        //id =id-1;
       return String( int(id/3)+"_"+ int(id%3));
    }
    //
    private function getHeroIDByName():int
    {
        return 0;
    }
    //
    public function get getType():int
    {
        return _type;
    }
}
}
