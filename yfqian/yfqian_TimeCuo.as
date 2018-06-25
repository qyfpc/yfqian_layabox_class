/**
 * Created by DELL on 2015/5/6.
 */
package yfqian {
	public class yfqian_TimeCuo
	{
		
		public static function getDay(Str:String):String{
			return String(Math.round(new Date(Str).getTime()/1000));
			
		}
		public static function getCuo():int{
			return Math.round(new Date().getTime()/1000);
			
		}
		public static function getDate(num:*):String
		{  
			var date:Date=new Date(num*1000); 
			var h:String;
			date.getHours()<=9?h="0"+date.getHours():h=String(date.getHours());
			var m:String;
			date.getMinutes()<=9?m="0"+date.getMinutes():m=String(date.getMinutes());
			var s:String;
			date.getSeconds()<=9?s="0"+date.getSeconds():s=String(date.getSeconds());


			
			return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate()+" "+h+":"+m+":"+s;
			
		}  
		public static function getDate_time(num:*):String
		{  
			var date:Date=new Date(num*1000); 
			var h:String;
			date.getHours()<=9?h="0"+date.getHours():h=String(date.getHours());
			var m:String;
			date.getMinutes()<=9?m="0"+date.getMinutes():m=String(date.getMinutes());
			var s:String;
			date.getSeconds()<=9?s="0"+date.getSeconds():s=String(date.getSeconds());
			
			
			
			return h+":"+m+":"+s;
			
		} 
		
		public static function getServerTime(num:Function):void
		{  

			
			num(true);

			
		}  
		
		public static function getTime(num:String="all"):*{//获取设备时间
			var data:*;
			var mydate:Date = new Date();
			var year:* = mydate.getFullYear();//年
			var month:*  = mydate.getMonth()+1;//月
			var date2:*  = mydate.getDate();//日
			var day:*  = mydate.getDay();//周
			var hour:*  = mydate.getHours();//时
			var minute:*  = mydate.getMinutes();//分
			var second:*  = mydate.getSeconds();//秒
			var mill:* =mydate.getMilliseconds();//毫秒
			
			
			
			var h:String;
			mydate.getHours()<=9?h="0"+mydate.getHours():h=String(mydate.getHours());
			var m:String;
			mydate.getMinutes()<=9?m="0"+mydate.getMinutes():m=String(mydate.getMinutes());
			var s:String;
			mydate.getSeconds()<=9?s="0"+mydate.getSeconds():s=String(mydate.getSeconds());
			if(num=="time"){
				data=getCuo();
			}else if(num=="day"){
				data=year+"-"+month+"-"+date2+" "+h+":"+m+":"+s;
			}else{
				data=JSON.parse('["'+String(yfqian_TimeCuo.getCuo())+'","'+year+'-'+month+'-'+date2+' '+h+':'+m+':'+s+'"]');
			}
			return data
		}
		public static function ToTime ( secs:int):String { 
			var h:int = Math.floor ( secs / 3600); 
			var m:int = Math.floor ( ( secs - h * 3600 ) / 60 ); 
			var s:int = secs - h * 3600 - m * 60; 
			var time:String; 
			
			var hS:String=String(h);
			var mS:String=String(m);
			var sS:String=String(s);
			if(h<=9){
				hS="0"+h;
			}
			if(m<=9){
				mS="0"+m;
			}
			if(s<=9){
				sS="0"+s;
			}
			
			if(h>=1){
				time=hS + ":" + mS + ":" + sS; 
			}else if(m>=1){
				time=mS + ":" + sS; 
			}else{
				time=String(sS); 
			}
			return time; 
		} 
	}
}