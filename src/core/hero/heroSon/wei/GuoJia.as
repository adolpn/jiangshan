package core.hero.heroSon.wei {
/**
 * 郭嘉
 */

import core.hero.Hero;

import data.BaseAttribute;

public class GuoJia extends Hero {
    private var _armData:Object;
    private var _type:int =0;           //阵营类型
    public function GuoJia(type:int=0) {
        _type =type;
        init();
        super(_attribute,_armData,_type);
    }
    //
    private function init():void
    {
        //设置兵种数据
        var armData:Object={};
        var arms:Array =[];
        arms.push(setArmObject(0,"gongjianshou1"));
        arms.push(setArmObject(0,"gongjianshou2"));
        arms.push(setArmObject(1,"gongjianshou1"));
        armData.arms =arms;
        armData.currentID = 1;
        _armData =armData;

        //设置基本属性
        _attribute = new BaseAttribute();
        _attribute.heroName ="郭嘉2";
        _attribute.setAttackAttrib(569,135,416,554);

        var thisSkill:ThisWeiSkill = new ThisWeiSkill();
        var thisAwakeSkill:ThisWeiAwakeSkill = new ThisWeiAwakeSkill();
        _skill =thisSkill;
        _awakeSill = thisAwakeSkill;
        //
        //_type = 1;
        // attribute:BaseAttribute,armData:Object, _type:int=0
    }

}
}

import core.hero.AwakenSkillBase;
import core.hero.SkillBase;

class ThisWeiSkill extends SkillBase{

    override protected function init():void
    {
        AttactType =0;//0 物理攻击 1魔法攻击
        AttactTargetType="frontRow";//攻击目标类型  "frontSingle","backSingle","minLifeSingle","frontRow","backRow","column";//攻击目标类型  单一(前后) 血量最少 前排 后排 列排
        AttactCoefficient =1;//攻击系数
        AddAnger_buff = false;//  是否给自己队友增加怒气
        SubtractAnger_debuff =false;//是否给敌人减少怒气
    }

}

class ThisWeiAwakeSkill extends AwakenSkillBase{

    override protected function init():void
    {
        AttactType =0;//0 物理攻击 1魔法攻击
        AttactTargetType="frontRow";//攻击目标类型  "frontSingle","backSingle","minLifeSingle","frontRow","backRow","column";//攻击目标类型  单一(前后) 血量最少 前排 后排 列排
        AttactCoefficient =1;//攻击系数
        AddAnger_buff = false;//  是否给自己队友增加怒气
        SubtractAnger_debuff =false;//是否给敌人减少怒气
    }
}
