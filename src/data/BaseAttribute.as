package data {
/**
 * 英雄基础属性
 */
public class BaseAttribute {
    public var heroURL:String;
    public var heroName:String;
    public var x:int=0;
    public var y:int=0;
    public var life:int =10000;
    public var yong:Number =569;    //勇
    public var yu:Number =135;
    public var zhi:Number =416;
    public var wei:Number =482;
    public  var weiSpeed:Number =19.1;      ////生命和威系数
    public var magicDefens:Number =500;
    public var magicSpeed:Number =0.6;        //魔法防御和智力系数
    public var phyicalDefens:Number = 101;
    public var angerPoint:int =0;//怒气
    public var dodge:Number =0.5;//闪避系数 物理
    public var penetrate:Number =0.5//识破 魔法
    public function BaseAttribute() {
        init();
    }
    //
    protected function init():void
    {
        initData();
    }
    protected function initData():void
    {
        heroURL ="";
        heroName="";
        x=0;
        y=0;
        setLife =554;
       //trace(life);
    }
    public function setAttackAttrib(_yong:Number,_yu:Number,_zhi:Number,_wei:Number):void
    {
        yong =_yong;
        yu =_yu;
         zhi =_zhi;
         wei =_wei;
        setLife =wei;
        setMagicDefens =zhi;
    }
    private function set setLife(_wei:Number):void
    {
        life = int(_wei*weiSpeed);
    }
    public function set setMagicDefens(_zhi:Number):void
    {
        magicDefens = int(_zhi*magicSpeed);
    }
    public function get getMagicDefens():Number
    {
        return magicDefens;
    }
    //
    public function set setPhyicalDefens(yong:Number):void
    {
        phyicalDefens = yong;
    }
    public function get getPhyicalDefens():Number
    {
        return phyicalDefens;
    }
    //获取物理攻击力
    public function get getPhyicalNum():Number
    {
        return wei;
    }
    //获取魔法攻击力
    public function get getMagicNum():Number
    {
        return zhi;
    }
}
}
