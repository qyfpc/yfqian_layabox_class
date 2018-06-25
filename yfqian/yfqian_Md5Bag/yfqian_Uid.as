package yfqian.yfqian_Md5Bag
{
	import yfqian.yfqian_TimeCuo;

	public class yfqian_Uid
	{
		
		public function yfqian_Uid()
		{
			
		}		
		public static function get():String
		{
			var md5Num:Array=["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N",
				"O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9"];
			var textStr:String=String(yfqian_TimeCuo.getCuo());
			for(var i:int=0;i<22;i++){
				var sjStr:Number=Math.round(Math.random()*((md5Num.length-1)-0)+0)
				textStr+=md5Num[sjStr];
			}
			textStr=yfqian_Md5.get(textStr);
			return textStr;
		}
	}
}