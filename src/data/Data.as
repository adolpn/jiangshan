package data {
public class Data {
    public static var Attack_Type:int =0;//0 物理攻击  1 魔法攻击 2 增益状态攻击  3 减益状态
    public static var ArmsData:Array =[{},{},{},{}];
    public function Data() {

    }
    public static function initArmData():void
    {
        trace("init data...")
        //步兵
        addArm(0,{"campid":0,"type":"damage","index":"gongjianshou1","name":"gongjianshou","url":"images/hero/1.png","id":0});
        addArm(0,{"campid":0,"type":"damage","index":"gongjianshou2","name":"gongjianshou","url":"images/hero/2.png","id":1});

        //弓兵
        addArm(1,{"campid":1,"type":"damage","index":"gongjianshou1","name":"gongjianshou","url":"images/hero/1.png","id":0});
        addArm(1,{"campid":1,"type":"damage","index":"gongjianshou2","name":"gongjianshou","url":"images/hero/2.png","id":0});
        //骑兵
        addArm(2,{"campid":2,"type":"damage","index":"gongjianshou","name":"gongjianshou","url":"images/hero/1.png","id":0});

        //特殊兵
        addArm(3,{"campid":3,"type":"damage","index":"gongjianshou","name":"gongjianshou","url":"images/hero/1.png","id":0});
    }
    public static function addArm(id:int,obj:Object):void
    {
      //  trace("增加");
        //{"campid":0,"type":1,"index":"gongjianshou","name":"gongjianshou","url":"images/hero/1.png","id":0}
        // campid 代表所属兵种类型 0步兵1弓兵2骑兵3特殊兵 type兵种效果damage 伤害类型 defens 防御类型 target 目标类型 state 状态类型
        var armObj:Object =ArmsData[id];
        var index:String =obj.index;
        armObj[index] =obj;
    }
}
}
