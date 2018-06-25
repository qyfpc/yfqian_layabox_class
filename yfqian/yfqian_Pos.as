package yfqian
{
	public class yfqian_Pos
	{
		/**
		 * 求两点之间的xy坐标。
		 * @param	var obj:Object={}
		 * @param	obj.StartDataX=630;
		 * @param	obj.StartDataY=100;
		 * @param	obj.StartTime=100;
		 * @param	obj.EndDataX=100;
		 * @param	obj.EndDataY=500;
		 * @param	obj.EndTime=100;
		 * @param	data:Object 启动到停止的坐标。
		 * @param	floor:Boolean=false 启用正数，默认false关闭 
		 * @param	参考升序：yfqian_Pos.spot(data,perCent)。
		 * @author yfqian
		 */
		public static function getPos(data:Object,floor:Boolean=false):Object{	
			var getData:Object={}
			var perCentNum:Number=perCent(Number(data.StartTime),Number(data.EndTime))
			getData.x=spot(data.StartDataX,data.EndDataX,perCentNum);
			getData.y=spot(data.StartDataY,data.EndDataY,perCentNum);
			if(floor==true){
				getData.x=Math.floor(getData.x);
				getData.y=Math.floor(getData.y);
			}
			return getData;
		}
		/**
		 * 两点之间百分比距离。
		 * @param	Start 起始数。
		 * @param	end 终止数。
		 * @param	perCent 百分比。
		 * @param	参考升序：yfqian_Pos.spot(Start,end,perCent)。
		 * @author yfqian
		 */
		public static function spot(Start:Number,end:Number,perCent:Number):Number{			
			var getToNum:Number=( Start - end ) * perCent / 100 + Start;
			return getToNum;
		}		
		/**
		 * 返回百分比的值
		 * @param	StartNum 起始数。
		 * @param	endNum 终止数。
		 * @param	参考升序：yfqian_Pos.perCent(Start,end)。
		 * @author yfqian
		 */
		public static function perCent(StartNum:Number,endNum:Number):Number{			
			var getToNum:Number=100/endNum*StartNum
			return getToNum;
		}	
	}
}