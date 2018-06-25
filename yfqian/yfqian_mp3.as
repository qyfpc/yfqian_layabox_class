package yfqian
{
	import laya.media.SoundManager;
	import laya.utils.Handler;
	
	import yfqian.init.res.Game_Data;

	public class yfqian_mp3
	{

		public static function on(mp3Url:String,ogg:String="mp3",caller:*=null,goToType:Function=null):void{
			if(Game_Data.gameSound==true){
				if(goToType==null){
					SoundManager.playSound("assets/mp3/"+mp3Url+"."+ogg);
				}else{
					SoundManager.playSound("assets/mp3/"+mp3Url+"."+ogg, 1, new Handler(caller, function():void{
						goToType();
					}));
				}
			}
		}
		public static var  bjmp3_url:String;
		public static function set bj_On(url:String):void{
			if(Game_Data.gameSound==true){
				bjmp3_url=url;
				SoundManager.playMusic(bjmp3_url);
			}
		}
		public static function stop():void{
			SoundManager.stopAll();

		}
		public static function start():void{
			SoundManager.playMusic(bjmp3_url);
		}
	}
}