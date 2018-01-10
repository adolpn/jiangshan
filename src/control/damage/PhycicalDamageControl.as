package control.damage {
/**
 * 物理伤害控制 计算
 */
    import core.hero.Hero;
    import data.*;
public class PhycicalDamageControl extends BaseDamageSort{
    private static var _instance:PhycicalDamageControl;
    public function PhycicalDamageControl() {
    }

    public static function getInstance():PhycicalDamageControl
    {
        if(_instance ==null)
        {
            _instance = new PhycicalDamageControl();
        }
        return _instance;
    }
    //
    public static function getDamageCount(attackHero:Hero,enemyHero:Hero):int
    {
        return getInstance().damageSort(attackHero,enemyHero);
    }
    override public function damageSort(attackHero:Hero,enemyHero:Hero):int
    {
        trace("物理攻击");
        var damageNum:int =0;//伤害数量
        var attackAttribute:BaseAttribute =attackHero.getAttribute;
        var enemyAttribute:BaseAttribute =enemyHero.getAttribute;
        var isDodgeState:Boolean =isDodge(enemyAttribute.dodge);
        if(isDodgeState)
        {
            trace("闪避成功");
            return damageNum;
        }
        damageNum = (getPhyical(attackAttribute) -getPhyicalDefense(enemyAttribute))*5;
        return damageNum;
    }
    //
    private function isDodge(dodgeNum:Number=0):Boolean
    {
        var r:Number =Math.random();
        if(r<dodgeNum)
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

}
}
