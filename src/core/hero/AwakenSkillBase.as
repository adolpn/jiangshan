package core.hero {
/*
  觉醒技能基础类
 */
public class AwakenSkillBase {
    protected var AttactType:int =0;//0 物理攻击 1魔法攻击
    protected var AttactTargetType:String="";//攻击目标类型  "frontSingle","backSingle","minLifeSingle","frontRow","backRow","column";//攻击目标类型  单一(前后) 血量最少 前排 后排 列排
    protected var AttactCoefficient:Number =0;//攻击系数
    protected var AddAnger_buff:Boolean = false;//  是否给自己队友增加怒气
    protected var SubtractAnger_debuff:Boolean =false;//是否给敌人减少怒气
    public function AwakenSkillBase() {
        init();
    }
    //
    protected function init():void
    {

    }
}
}
