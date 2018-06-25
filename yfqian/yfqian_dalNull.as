package yfqian
{
	public class yfqian_dalNull
	{
		public static function dal(char:String):String{
			if(char == null){
				return null;
			}
			return rtrim(ltrim(char));
		}
		private static function ltrim(char:String):String{
			if(char == null){
				return null;
			}
			var pattern:RegExp = /^\s*/;
			return char.replace(pattern,"");
		}
		private static function rtrim(char:String):String{
			if(char == null){
				return null;
			}
			var pattern:RegExp = /\s*$/;
			return char.replace(pattern,"");
		}
		public static function text(char:String):String{
			var str:String = char.replace(/([  ]{1})/g,"");	
			return str;
		}
	}
}

