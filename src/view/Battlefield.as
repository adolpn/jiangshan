package view {

import core.hero.heroSon.shu.JiangWei;
import core.hero.heroSon.shu.LiuBei;
import core.hero.heroSon.shu.MaChao;
import core.hero.heroSon.shu.ZhangFei;
import core.hero.heroSon.shu.ZhaoYun;
import core.hero.heroSon.shu.ZhuGeLiang;
import core.hero.heroSon.wei.CaoChao;
import core.hero.heroSon.wei.GuoJia;
import core.hero.heroSon.wei.LiDian;
import core.hero.heroSon.wei.SiMaYi;
import core.hero.heroSon.wei.XiaHouChun;
import core.hero.heroSon.wei.YuJing;

import flash.display.Sprite;
import flash.events.Event;

import core.hero.Hero;
import data.BaseAttribute;

import flash.geom.Point;
import data.Data;
public class Battlefield extends Sprite {
    private var _hero1:Hero;
    private var _hero2:Hero;
    private static var _instance:Battlefield;
    private var _heroTeamA:HeroTeam;
    private var _heroTeamB:HeroTeam;
    public function Battlefield() {
        super();
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
    //
    private function init():void
    {
        createBattleField();
    }
    //
    public static function getInstance():Battlefield
    {
        if(_instance ==null)
        {
            _instance = new Battlefield();
        }
        return _instance;
    }
    //
    private function createBattleField():void
    {
        _heroTeamA = new HeroTeam(0,new Point(130,150));
        addChild(_heroTeamA);
        _heroTeamA.x = 50;
        _heroTeamA.y = 350;
        _heroTeamA.addHero(new ZhaoYun(_heroTeamA.getType),0);
        _heroTeamA.addHero(new MaChao(_heroTeamA.getType),1);
        _heroTeamA.addHero(new LiuBei(_heroTeamA.getType),2);
        _heroTeamA.addHero(new ZhuGeLiang(_heroTeamA.getType),3);
        _heroTeamA.addHero(new ZhangFei(_heroTeamA.getType),4);
        _heroTeamA.addHero(new JiangWei(_heroTeamA.getType),5);

        _heroTeamB = new HeroTeam(1,new Point(130,150));
        addChild(_heroTeamB);
        _heroTeamB.x = 50;
        _heroTeamB.y = 0;
        _heroTeamB.addHero(new CaoChao(_heroTeamB.getType),0);
        _heroTeamB.addHero(new SiMaYi(_heroTeamB.getType),1);
        _heroTeamB.addHero(new GuoJia(_heroTeamB.getType),2);
        _heroTeamB.addHero(new XiaHouChun(_heroTeamB.getType),3);
        _heroTeamB.addHero(new LiDian(_heroTeamB.getType),4);
        _heroTeamB.addHero(new YuJing(_heroTeamB.getType),5);
    }
    public function getHero(_id:int,campType:int):Hero
    {
        switch(campType)
        {
            case 0:
               return _heroTeamA.getHeroByID(_id);
                break;
            case 1:
                return _heroTeamB.getHeroByID(_id);
                break;
        }
        return null;
    }
    //获取兵种数据
    public function getArmObject(id:int=0,armName:String=""):Object
    {
        var obj:Object = Data.ArmsData[id];
        trace(Data.ArmsData[id]);
        var armobj:Object = Data.ArmsData[id][armName];
       return armobj;
    }
}
}
