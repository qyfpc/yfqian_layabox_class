package yfqian.init
{
	import laya.display.Sprite;
	import laya.utils.Handler;
	import laya.utils.Stat;
	import laya.utils.Tween;
	
	import yfqian.yfqian_TimeCuo;

	public class InitYfqian
	{
		public static var SaveList:Array=[];
		public function InitYfqian(GoTo_Name:Object,fps:Boolean=false, lognTime:int = 2000 ){
			if(fps==true){
				Stat.show(0, 0);
			}
			
//			var Text_FB:Text = new Text();
//			Text_FB.text="LayaAir(2016,v1),引擎初始化..."
//			Text_FB.width=Main.MaxW;
//			Text_FB.height=Main.MaxH-2;
//			Text_FB.align= "right";
//			Text_FB.valign="bottom";
//			Text_FB.fontSize = 20;
//			Text_FB.color = "#FFFFFF";
//			Laya.stage.addChild(Text_FB);
			
			var MaxUi_BJ:Sprite = new Sprite();
			MaxUi_BJ.graphics.drawRect(0,0, yfqian_Data.MaxWidth , yfqian_Data.MaxHeight,"0x000000");
			
			var timeCuo:int=yfqian_TimeCuo.getCuo();
			
			trace(yfqian_TimeCuo.getCuo(),yfqian_TimeCuo.getDate(timeCuo));
			var logGs:Sprite = new Sprite();
			logGs.loadImage("assets/gamelogo/ld_logGs.jpg",0,0,0,0,new Handler(this,function():void{
//				Laya.stage.removeChild(Text_FB);
				MaxUi.GameMaxUi.addChild(MaxUi_BJ);
				MaxUi.GameMaxUi.addChild(MaxUi.GameUi)
				MaxUi.GameMaxUi.addChild(MaxUi.GameLoadingUi)
				MaxUi.GameLoadingUi.addChild(MaxUi_BJ);
				MaxUi.GameLoadingUi.addChild(logGs);
				MaxUi.GameUi.addChild(MaxUi_BJ);
				logGs.pos(0,0)
				if(lognTime>=1){
					Laya.timer.once(lognTime, this, onComplete1);
				}else{
					MaxUi.GameLoadingUi.removeChild(MaxUi_BJ);
					MaxUi.GameLoadingUi.removeChild(logGs);
					new Ui_01_Loading(GoTo_Name);
				}
				
				function onComplete1():void{
					MaxUi.GameLoadingUi.removeChild(MaxUi_BJ);
					Tween.to(logGs,{ alpha:0}, 1000);
					Laya.stage.timer.once(800,this,function():void{
						Laya.stage.timer.clearAll(this);
						MaxUi.GameLoadingUi.removeChild(logGs);
						new Ui_01_Loading(GoTo_Name);
					});
					
				}
			
			}));
			
		}
	}
}