package yfqian
{
	import laya.display.Text;
	import laya.events.Event;
	import laya.net.HttpRequest;
	
	import yfqian.init.setTimeout;
	import yfqian.yfqian_GG.yfqian_Loading;

	public class yfqian_getXml
	{
		public function yfqian_getXml(NameJosn:String,UiObj:Object,caller:*)
		{
			var Logn:yfqian_Loading=new yfqian_Loading();
			
			var hr:HttpRequest;
			var info:Text;
			
			hr = new HttpRequest();
			hr.once(Event.PROGRESS, caller, onHttpRequestProgress);
			hr.once(Event.COMPLETE, caller, onHttpRequestComplete);
			hr.once(Event.ERROR, caller, onHttpRequestError);
			hr.send(NameJosn, null, 'get', 'xml');
			
			
			function onHttpRequestError(e:*):void
			{
				//				trace(e);
			}
			
			function onHttpRequestProgress(e:*):void
			{
				//				trace(e)
			}
			
			function onHttpRequestComplete(e:*):void
			{
				
				setTimeout.on(method,800);
				
			}
			function method():void{
				setTimeout.off(method);
				Logn.off();
				UiObj(hr.data);
				
				
				//				info.text = "收到数据：" + hr.data;
			}
		}
	}
}