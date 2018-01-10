package control.attack {
/**
 * 攻击目标控制
 */

import core.hero.Hero;

import view.Battlefield;
    public class AttackTargetControl {

    public function AttackTargetControl() {
    }

        public static function getEnemyTarget(attackHero:Hero):Array
        {
            var target:Array =[];
            switch(attackHero.getActionAttribute.attackTargetTypeName)
            {
                case "frontSingle":
                    target = getFrontSingle(attackHero.getHeroID);
                    break;
                case "backSingle":
                    target = getBackSingle(attackHero.getHeroID);
                    break;
                case "minLifeSingle":
                    break;
                case "frontRow":
                    break;
                case "backRow":
                    break;
                case "column":
                    break;
                default:
                    break;
            }
            return target;
        }
        //需要优化(不同阵营位置是反的)
        protected static function  getFrontSingle(id:int):Array
        {
            //因为不同阵营属于相反位置
            return [Math.abs(int(id%3)-2)];
        }
        //需要优化(不同阵营位置是反的)
        protected static function getBackSingle(id:int):Array
        {
            var id:int =Math.abs(int(id%3)+3);
            if(id>4)
            {
                id -=2;
            }else if(id<4)
            {
                id+=2;
            }
            return [id];
        }
}
}
