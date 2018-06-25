package yfqian
{
	public class yfqian_speed
	{
		/**
		 * 用于删除某个数组中的元素 
		 * @param var TimeDH:Number=yfqian_speed.ydTimer([x,y],[x,y],1000);
		 * @param goUi 移动ui，坐标
		 * @param onUi 当前ui，坐标
		 * @param timer 移动时间
		 * @return var TimeDH:Number;
		 * @author yfqian
		 */
		public static function ydTimer(goUi:Object,onUi:Object,timer:Number=1000):Number{
			
			var TimeX:Number=Number(goUi[0])-Number(onUi[0]);
			if(TimeX<=0){
				TimeX=Number(onUi[0])-Number(goUi[0]);
			}
			var TimeY:Number=Number(goUi[1])-Number(onUi[1]);
			if(TimeY<=0){
				TimeY=Number(onUi[1])-Number(goUi[1]);
			}
			var TimeDH:Number=TimeX;
			if(TimeX<=TimeY){
				TimeDH=TimeY;
			}
			var timeMaxNum:Number=timer;
			TimeDH=timeMaxNum*((timeMaxNum/100*Number(TimeDH)/timeMaxNum*100)/1000);
			
			return TimeDH;
		}
	}
}