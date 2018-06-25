package yfqian.init
{
	import laya.utils.Browser;

	public class yfqian_laya
	{
		public static var win_Width:int;//窗口大小
		public static var win_Height:int;//窗口大小
		public static var pc:Boolean;//是否电脑
		public static var web:Boolean//是否网页;		
		public static var isweixin:Boolean//是否微信;
		public static var LHList:Array=[]//刘海手机列表;
		public static var isLH:Boolean;//刘海手机列表;
		public static function init():void
		{
			Main.MaxW=yfqian_Data.MaxWidth;
			Main.MaxH=yfqian_Data.MaxHeight;
			pc=true;

			__JS__('yfqian_laya.pc = false');
			
			__JS__("var bs={//yfqian判断");
			__JS__("versions:function(){//");
			__JS__("var u = navigator.userAgent, app = navigator.appVersion");
			__JS__("return {//移动终端浏览器版本信息");
			__JS__("trident: u.indexOf('Trident') > -1, //IE内核");
			__JS__("presto: u.indexOf('Presto') > -1, //opera内核");
			__JS__("webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核");
			__JS__("gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核");
			__JS__("mobile: !!u.match(/AppleWebKit.*Mobile.*/)||!!u.match(/AppleWebKit/), //是否为移动终端");
			__JS__("ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端");
			__JS__("android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器");
			__JS__("iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器|| u.indexOf('Mac') > -1");
			__JS__("iPad: u.indexOf('iPad') > -1, //是否iPad");
			__JS__("webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部");
			__JS__("};//");
			__JS__("}(),//");
			__JS__("language:(navigator.browserLanguage || navigator.language).toLowerCase()//");
			__JS__("}//");
			__JS__("if(bs.versions.mobile){//");
			__JS__("if(bs.versions.android||bs.versions.iPhone||bs.versions.ios){//");
			__JS__("yfqian_laya.web=false");
			__JS__("}else if(bs.versions.iPad){//");
			__JS__("yfqian_laya.web=true");
			__JS__("}//");
			__JS__("else{//");
			__JS__("yfqian_laya.web=true");
			__JS__("}//");
			__JS__("}//");
			var ua:*;
			__JS__("ua = window.navigator.userAgent.toLowerCase()");
			if(ua.match(/MicroMessenger/i) == 'micromessenger'){
				isweixin=true
			}else{	
				isweixin=false
			}
			var ratio:Number=Browser.clientHeight/Browser.clientWidth;
			var height:Number=Browser.clientHeight;
			isLH=false;
			
			if(Browser.window.screen.height*3==2436){
				isLH=true;
			}
			
		}
	}
}