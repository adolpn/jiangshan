package control.damage {
import core.hero.Hero;

import data.BaseAttribute;
public class DamageControl {

    private static var _instance:DamageControl;
    public function DamageControl() {
    }
    public static function getInstance():DamageControl
    {
        if(_instance ==null)
        {
            _instance = new DamageControl();
        }
        return _instance;
    }
    //
    public function getDamageCount(attackHero:Hero,eEnemyHero:Hero):int
    {
        var demageNum:Number = 0;
        var attackAttrib:BaseAttribute = attackHero.getAttribute as BaseAttribute;
        var attackType:int =attackHero.getActionAttribute.attackType;
        var eEnemyAttrib:BaseAttribute = eEnemyHero.getAttribute as BaseAttribute;
        //trace("selfAttrib.life:"+selfAttrib.life);

        switch(attackType)
        {
            case 0://物理伤害
                demageNum = PhycicalDamageControl.getDamageCount(attackHero,eEnemyHero);
                break;
            case 1://魔法伤害
                demageNum = MagicDamageControl.getDamageCount(attackHero,eEnemyHero);
                break;
            case 2:
                break;
            case 3:
                break;
            default:
                break;
        }
        return demageNum;
    }

}
}
