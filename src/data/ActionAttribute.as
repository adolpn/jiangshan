package data {
/**
 * 行为属性
 */
public class ActionAttribute {
    public var attackType:int =0;   // 0 物理攻击 1 魔法攻击
    public var campType:int =0;     //所属阵营 0,1
    public static var attackTargetTypeData:Array=["frontSingle","backSingle","minLifeSingle","frontRow","backRow","column",""];//攻击目标类型  单一(前后) 血量最少 前排 后排 列排
    public var attackTargetTypeName:String;
    public function ActionAttribute() {
    }
}
}
