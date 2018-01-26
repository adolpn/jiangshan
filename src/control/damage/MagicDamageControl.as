package control.damage {
/**
 * 魔法伤害计算 控制
 */
import core.hero.Hero;
import data.*;
public class MagicDamageControl extends BaseDamageSort{
    private static var _instance:MagicDamageControl;
    public function MagicDamageControl() {
    }

    public static function getInstance():MagicDamageControl
    {
        if(_instance ==null)
        {
            _instance = new MagicDamageControl();
        }
        return _instance;
    }

    public static function getDamageCount(attackHero:Hero,enemyHero:Hero):int
    {
        return getInstance().damageSort(attackHero,enemyHero);
    }
    override public function damageSort(attackHero:Hero,enemyHero:Hero):int
    {
        trace("魔法攻击........");
        var damageNum:int =0;//伤害数量
        var attackAttribute:BaseAttribute =attackHero.getAttribute;
        var enemyAttribute:BaseAttribute =enemyHero.getAttribute;
        var isPenetrateState:Boolean =isPenetrate(enemyAttribute.dodge);
        if(isPenetrateState)
        {
            trace("识破成功");
            return damageNum;
        }
        damageNum = sortMagicNum(attackAttribute,enemyAttribute);
        return damageNum;
    }
    //
    private function isPenetrate(penetrateNum:Number=0):Boolean
    {
        var r:Number =Math.random();
        if(r<penetrateNum)
        {
            return true;
        }else
        {
            return false;
        }
    }

    //获取公里攻击力
    private function getPhyical(attribe:BaseAttribute):Number
    {
        var num:Number =attribe.getPhyicalNum;
        return num;
    }
    private function getPhyicalDefense(attribe:BaseAttribute):Number
    {
        var num:Number =attribe.getPhyicalDefens;
        return num;
    }
    //获取公里攻击力
    private function getMagic(attribe:BaseAttribute):Number
    {
        var num:Number =attribe.getMagicNum;
        return num;
    }
    //计算魔法伤害量
    private function sortMagicNum(attackAttribute:BaseAttribute,enemyAttribute:BaseAttribute):Number
    {
        return (getMagic(attackAttribute) -getMagicDefense(enemyAttribute))*5;
    }
    private function getMagicDefense(attribe:BaseAttribute):Number
    {
        var num:Number =attribe.getMagicDefens;
        return num;
    }

}
}
