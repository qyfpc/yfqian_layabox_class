package yfqian.init.res
{
	import game.data.res.getData;
	import game.data.res.TimerQuest.getTimeType;
	
	import yfqian.yfqian_TimeCuo;

	public class FirstBlood
	{
		
		public function FirstBlood(){	
			new getData();//属性游戏数据
			new getTimeType();
			Game_Data.gameTimer=yfqian_TimeCuo.getCuo();
		}	
		
		
	}
}