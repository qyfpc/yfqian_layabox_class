package  yfqian.yfqian_save
{
	import laya.net.LocalStorage;
	

	/**
	 * 全局ShareObject管理器
	 * location shareobject manager
	 * @author hengry
	 */	
	public final class yfqian_SaveALoad
	{
		public static function set(key:String, value:String):String
		{
			LocalStorage.setItem(key,value);
			return value;
		}
		public static function get(key:String):String
		{
			return LocalStorage.getItem(key);
		}
		public static function del():void
		{
			LocalStorage.clear();
		}
		public static function kill(key:String):void
		{
			LocalStorage.removeItem(key);
		}
	}
}