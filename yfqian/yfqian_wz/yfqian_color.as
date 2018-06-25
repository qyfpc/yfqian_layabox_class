package yfqian.yfqian_wz
{
	import laya.display.Text;
	import laya.events.Event;

	public class yfqian_color
	{
		private var txt:Text;
		private var prevX:Number = 0;
		private var prevY:Number = 0;
		private var gdbarskin:String;
		//bgborder是边距
		public function yfqian_color(textui:*,scrollbarskin:String="all",bgborder:int=0)
		{
			
		}
		/**
		 * 取值：1深灰 2灰 3白 4黄 5天蓝 6深蓝 7紫 8橙 9红 10暗金
		 * @param 取值：1深灰 2灰 3白 4黄 5天蓝 6深蓝 7紫 8橙 9红 10暗金
		 * @author yfqian
		 */
		public static var get:Array=["#7a7a7a","#aaaaaa","#ffffff","#fcff00","#00f6ff","#0078ff","#ff00fc","#ffb400","#ff0000","#f8de9d"];
		public static function get_color(colorNum:Number):String{
			var ColorName:String;
			switch ( colorNum )
			{//1，深灰2 灰，3白，4黄，5天蓝，6深蓝，7紫，8橙，9红
				case 1:
					ColorName = "#7a7a7a";//深灰
					break;
				case 2:
					ColorName = "#aaaaaa";//灰
					break;
				case 3:
					ColorName = "#ffffff";//白
					break;
				case 4:
					ColorName = "#fcff00";//黄
					break;
				case 5:
					ColorName = "#00f6ff";//天蓝
					break;
				case 6:
					ColorName = "#0078ff";//深蓝
					break;
				case 7:
					ColorName = "#ff00fc";//紫
					break;
				case 8:
					ColorName = "#ffb400";//橙
					break;
				case 9:
					ColorName= "#ff0000";//红
					break;
				default:
					ColorName= "#f8de9d";//暗金
			}
			
			return ColorName;
		}

	}
}