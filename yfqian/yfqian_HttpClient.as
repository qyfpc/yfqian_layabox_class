package yfqian
{
	import laya.events.Event;
	import laya.net.HttpRequest;
	
	import yfqian.yfqian_GG.yfqian_UiGG;
	
	/**
	 * http网络请求工具
	 * @author lzm
	 */	
	public class yfqian_HttpClient
	{
		/**
		 * 请求url 
		 * @param url
		 * @param params
		 * @param completeFunction
		 * @param method
		 * 
		 */		
		public static function on(ulr:String,params:*,completeFunction:Function,method:String="post",responseType:String = "json"):void{
			phpList(ulr,params,completeFunction,method,responseType);
			
			function phpList(ulr:String,params:*,completeFunction:Function,method:String,responseType:String = "json"):void{
				var params:Object={
					uid:2,
					sid:3
				}
				yfqian_HttpClient.get(ulr,params,Laya.stage,function(deta):void{
					completeFunction(deta);

				},function(int:*):void{
					trace(1111111111)
					var textObj:Object={
						TM:"游戏公告"
					}
					if(int==2){
						textObj.NR="您的链接错误"
					}else{
						textObj.NR="网络出错请重试！"
					}
					new yfqian_UiGG(textObj,1,gotoGGUi);
					function gotoGGUi():void{
						new phpList(ulr,params,completeFunction,method,responseType);
					}
				},method,responseType);
			}
		}
		
		
		public static function get(url:String,params:Object,caller:*,completeFunction:Function=null,timeoutFunction:Function=null,method:String="get",responseType:String = "json"):void{
//			if(lognUi==true){
//				var Logn:yfqian_Loading=new yfqian_Loading();
//			}
//			
			
			var k:String;
			var kArr:Array=[];
			var kNameArr:Array=[];
			var kMixNum:int=0;
			var postUrl:String="";
			
			for (k in params){
				
				kNameArr[kMixNum]=k;
				kArr[kMixNum]=params[k];
				kMixNum++;
			}
			
			
			
			var request:HttpRequest;
			if(method=="get"){
				getRequest();
			}else if(method=="post"){
				postRequest();
			}
	

			function getRequest():void{
				url += "?"

				for(var i:int=0;i<kArr.length;i++){
					if(i>=kArr.length-1){
						url += kNameArr[i]+"="+kArr[i];
					}else{
						url += kNameArr[i]+"="+kArr[i] + "&";	
					}
					
				}
				postUrl=null;
				
			}
			
			function postRequest():void{
				
				for(var ia:int=0;ia<kArr.length;ia++){
					if(ia>=kArr.length-1){
						postUrl += kNameArr[ia]+"="+kArr[ia];
					}else{
						postUrl += kNameArr[ia]+"="+kArr[ia] + "&";	
					}
					
				}

			}
			yfqian_js.get("debug");
			if(yfqian_js.get("debug")=="yfqian"){
				trace("debug_url:",url+"?"+postUrl);
			}
			request = new HttpRequest();
			request.once(Event.PROGRESS,caller, onHttpRequestProgress);
			request.once(Event.COMPLETE,caller, onHttpRequestComplete);
			request.once(Event.ERROR, caller, onHttpRequestError);
			request.send(url, postUrl,method,responseType);
			
			function onHttpRequestError(e:*):void//错误
			{
				timeoutFunction(1);
				trace(request["_http"].response);//错误信息
				trace("#$#$",request);
				
//				Logn.off();
			}
			
			function onHttpRequestProgress(e:*):void//进度
			{
				timeoutFunction(2);
//				Logn.off();
			}
			
			function onHttpRequestComplete(e:*):void
			{
//				trace( "收到数据：" + request.data);
				completeFunction(request.data);
//				Logn.off();
			}
			
		}
		


	}
}