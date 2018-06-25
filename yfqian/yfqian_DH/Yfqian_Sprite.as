package yfqian.yfqian_DH
{
	import laya.utils.Ease;
	import laya.utils.Handler;
	import laya.utils.Tween;

	public class Yfqian_Sprite
	{
		public static function OnVis(AnNiuObj:*,obj:Function=null,caller:*=null):void{
//			AnNiuObj.visible = true;
//			AnNiuObj.scaleX = AnNiuObj.scaleY = 0;
//			if(obj==null){
//				Tween.to( AnNiuObj, { scaleX: 1, scaleY: 1 },600,Ease.backOut);
//			}else{
//				Tween.to( AnNiuObj, { scaleX: 1, scaleY: 1 },600,Ease.backOut,new Handler(caller,function():void{	
//					obj();
//				}))
//			}
			var UiX:int=AnNiuObj.x;
			AnNiuObj.visible = true;
			AnNiuObj.x =-540;
			AnNiuObj.alpha=1;
			AnNiuObj.scaleX = AnNiuObj.scaleY = 1;
			if(obj==null){
				Tween.to( AnNiuObj, { x:UiX },600,Ease.circOut);
			}else{
				Tween.to( AnNiuObj, { x:UiX },600,Ease.circOut,new Handler(caller,function():void{	
					obj();
				}))
			}


		}
		public static function OffVis(AnNiuObj,obj:Function=null,caller:*=null):void {//移动层，关闭层
			var UiX:int=AnNiuObj.x;
		
			if(obj==null){
				Tween.to( AnNiuObj, { x:540 },400,Ease.circIn,new Handler(caller,function():void{	
					AnNiuObj.x =UiX;
					AnNiuObj.visible = false;
				}));
				Laya.stage.timer.once(100,caller,function():void{
					Tween.to( AnNiuObj, {alpha:0 },300);
				});
			}else{
				Tween.to( AnNiuObj, {  x:540},400,Ease.circIn,new Handler(caller,function():void{	
					AnNiuObj.x =UiX;
					AnNiuObj.visible = false;
					obj();
				}))
				
				Laya.stage.timer.once(100,caller,function():void{
					Tween.to( AnNiuObj, { alpha:0  },300);
				});
			}
		}
		public static function OnTC(AnNiuObj:*,obj:Function=null,caller:*=null):void{
			AnNiuObj.visible = true;
			AnNiuObj.scaleX = AnNiuObj.scaleY = 0;
			if(obj==null){
				Tween.to( AnNiuObj, { scaleX: 1, scaleY: 1 },600,Ease.backOut);
			}else{
				Tween.to( AnNiuObj, { scaleX: 1, scaleY: 1 },600,Ease.backOut,new Handler(caller,function():void{	
					obj();
				}))
			}
			
		}
		public static function OffTC(AnNiuObj,obj:Function=null,caller:*=null):void {//移动层，关闭层
			Tween.clearTween(AnNiuObj);

			AnNiuObj.scaleX = AnNiuObj.scaleY = 1;	

			AnNiuObj.mouseEnabled=AnNiuObj.mouseThrough=false;
			if(obj==null){
				Tween.to( AnNiuObj, { scaleX: 0, scaleY: 0 },400,Ease.backIn,new Handler(caller,function():void{	
					AnNiuObj.mouseEnabled=true;
					AnNiuObj.scaleX = AnNiuObj.scaleY = 1;	
					AnNiuObj.visible = false;
				}))
			}else{
				Tween.to( AnNiuObj, { scaleX: 0, scaleY: 0 },400,Ease.backIn,new Handler(caller,function():void{	
					AnNiuObj.mouseEnabled=true;
					AnNiuObj.scaleX = AnNiuObj.scaleY = 1;	
					AnNiuObj.visible = false;
					obj();	
				}))
			}
		}
	}
}