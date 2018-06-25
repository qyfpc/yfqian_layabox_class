package yfqian
{
	import laya.display.Text;
	import laya.events.Event;
	import laya.net.HttpRequest;
	
	import yfqian.yfqian_Md5Bag.yfqian_Key;

	public class yfqian_getJosn
	{
		public function yfqian_getJosn(NameJosn:String,UiObj:Object,getText:String="json")
		{

			var hr:HttpRequest;
			var info:Text;

			hr = new HttpRequest();
			hr.once(Event.PROGRESS, this, onHttpRequestProgress);
			hr.once(Event.COMPLETE, this, onHttpRequestComplete);
			hr.once(Event.ERROR, this, onHttpRequestError);
			hr.send(NameJosn, null, 'get', getText);
			
//			info = new Text();
//			info.fontSize = 20;
//			info.align = 'center';
//			info.size(550 , 30);
//			info.y = 180;
//			info.color = "#FFFFFF";
//			info.text = "等待响应...";
//			Laya.stage.addChild(info);
			
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

				Laya.stage.timer.once(800,this,method);

			}
			function method():void{
				Laya.stage.timer.clear(this,method);
				UiObj(hr.data);
				

//				info.text = "收到数据：" + hr.data;
			}
		}
		public static function get_yfqian(NameJosn:String,UiObj:Function,getText:String="txt"):void
		{
			
			var hr:HttpRequest;
			var info:Text;
			
			hr = new HttpRequest();
			hr.once(Event.PROGRESS, Laya.stage, onHttpRequestProgress);
			hr.once(Event.COMPLETE, Laya.stage, onHttpRequestComplete);
			hr.once(Event.ERROR, Laya.stage, onHttpRequestError);
			hr.send(NameJosn, null, 'get', "text");
			function onHttpRequestError(e:*):void //错误
			{
				//				trace(e);
			}
			function onHttpRequestProgress(e:*):void //进度
			{
				//				trace(e)
			}
			
			function onHttpRequestComplete(e:*):void
			{
				var jsonArray:Object;
				var jsonData:Array;
				if(getText=="txt"){
					var str:String=hr.data;
					UiObj(str);
				}else if(getText=="json"){
					try{
						jsonArray= JSON.parse(hr.data);	
						UiObj(jsonArray);
					}catch(e){
						UiObj(null);
					}
				}else{
					str=hr.data;
					if(getText=="yfqian_exp"){
						jsonData=yfqian_Key.getExp(str)
						UiObj(jsonData);
					}
				}

				//				info.text = "收到数据：" + hr.data;
			}
		}
	}
}