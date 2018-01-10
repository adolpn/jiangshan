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

        //
        //_type = 1;
        // attribute:BaseAttribute,armData:Object, _type:int=0
    }

}
}
