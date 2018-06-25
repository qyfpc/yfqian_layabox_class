package yfqian
{
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Tween;
	
	public class yfqian_AnNiu
	{
		public static var type:Boolean=true;
		public static function get(AnNiuObj:*,toAnType:Boolean=true,caller:*=null,data:*=null,toObj:Function=null):void{
			type=false;
			if(toAnType==true){
				AnNiuObj.scaleX=AnNiuObj.scaleY=0.7
//				Tween.to(AnNiuObj,{ scaleX: 0.7,scaleY: 0.7 },80,Ease.backIn,new Handler(caller,function():void{
					Tween.to(AnNiuObj,{ scaleX: 1,scaleY: 1 },120,Ease.backOut,new Handler(caller,function():void{
						type=true;
						if(toObj!=null){
							toObj(data);
						}
					}));
//				}));
			}else{
				if(AnNiuObj.scaleX == 1) {
					AnNiuObj.scaleX = AnNiuObj.scaleY = 1;
					Tween.to(AnNiuObj,{ scaleX: 0.7,scaleY: 0.7 },200,Ease.backIn,new Handler(caller,function():void{
						Tween.to(AnNiuObj,{ scaleX: 1,scaleY: 1 },600,Ease.elasticOut,new Handler(caller,function():void{
							type=true;
							if(toObj!=null){
								toObj(data);
							}
						}));
					}));
				}
			}
		}
		
	}
}