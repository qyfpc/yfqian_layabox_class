package yfqian.init.res
{
	import laya.net.Loader;
	

	public class Game_List
	{
		public static var imgName:String=".atlas";//atlas;
//		http://gametd-1251461480.cossh.myqcloud.com/gameImg
		public static var Arr:Array=[			
			{url:Game_Data.cdnIp+"res/atlas/ggUi"+Game_Data.Bbv, type: Loader.ATLAS},
			{url:Game_Data.cdnIp+"res/atlas/ideUi"+Game_Data.Bbv, type: Loader.ATLAS},
			{url:Game_Data.cdnIp+"res/atlas/all/gg"+Game_Data.Bbv, type: Loader.ATLAS},
			{url:Game_Data.cdnIp+"res/atlas/all/Loading"+Game_Data.Bbv, type: Loader.ATLAS},
			{url:Game_Data.cdnIp+"all/Loading/ld_beijing.jpg"+Game_Data.AllBbv,type: Loader.IMAGE},
			{url:Game_Data.cdnIp+"assets/mp3/bg_bgm.mp3"+Game_Data.AllBbv,type: Loader.SOUND}
		];
	}
}