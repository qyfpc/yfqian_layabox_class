package yfqian
{
	public class yfqian_js
	{
		/**
		 *@param var ceshi:String=yfqian_js.get("openid");
		 */
		public static function get(key:String):*{
			var reg:* = new RegExp("(^|&)"+key+"=([^&]*)(&|$)");
			var result:* = __JS__('window.location.search.substr(1).match(reg)');
			return result?decodeURIComponent(result[2]):null;
		} 
	}
}