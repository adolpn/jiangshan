package control.attack {
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

import core.events.AttackEvent;
import control.attack.AttackEventControl;
import control.damage.DamageControl;
import view.Battlefield;
import core.hero.Hero;
import data.BaseAttribute
/**
 *  攻击系统
 */
public class AttackControl extends EventDispatcher {
    private var _battlefield:Battlefield;
    public function AttackControl(_batt) {
        super();
        _battlefield = _batt;
        init();
    }
    private function init():void
    {
        AttackEventControl.getInstance().addEventListener(AttackEvent.Attacked_Event,attackedHandle);
        AttackEventControl.getInstance().addEventListener(AttackEvent.BeAttacked_Event,beAttackedHandle);
    }


    //攻击处理
    private function attackedHandle(e:AttackEvent):void
    {
       // var ememyAttribute:BaseAttribute = e.dataObject as BaseAttribute;
        //trace("攻击系统检 检测到了攻击 发起者是:"+e.dataObject.heroName);
        var attackHero:Hero = e.dataObject as Hero;
        //var attackHero:Hero = _battlefield.getHero(ememyAttribute.heroName) as Hero;
        if(attackHero !=null)
        {
            trace("攻击系统检  发起者是:"+attackHero.getAttribute.heroName+ " parent name:"+attackHero.parent.name+" 英雄id:"+attackHero.getHeroID);
        }else
        {
            trace("获取不到英雄对象..");
            return;
        }
        var enemyType:int =0;
        if(attackHero.getActionAttribute.campType==0)
        {
            enemyType =1;
        }
       var enemyHeroArray:Array =AttackTargetControl.getEnemyTarget(attackHero);
        for(var i:int =0;i<enemyHeroArray.length;i++)
        {
           var enemyHero:Hero= _battlefield.getHero(enemyHeroArray[i],enemyType) as Hero;
            trace("被攻击阵营ID："+enemyHero.getActionAttribute.campType+ " 英雄名字："+enemyHero.getAttribute.heroName + " 英雄id:"+enemyHero.getHeroID);
            var damageNum:int = DamageControl.getInstance().getDamageCount(attackHero,enemyHero);
            trace("伤害量:"+damageNum);
            enemyHero.beAttack(damageNum);
            attackHero.attackResult({"damageNum":damageNum});
        }

    }
    //获取被攻击英雄ID(0~5)
    private function getBeAttackeName():String
    {
        return "";
    }
    //被攻击处理
    private function beAttackedHandle(e:AttackEvent):void
    {

    }
}
}
