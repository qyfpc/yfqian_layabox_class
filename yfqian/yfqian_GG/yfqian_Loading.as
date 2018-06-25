package yfqian.yfqian_GG
{
	import laya.display.Sprite;
	import laya.display.Text;
	import laya.ui.Clip;
	import laya.utils.Timer;
	
	import yfqian.init.MaxUi;
	import yfqian.init.yfqian_Data;
	
	public class yfqian_Loading
	{
		public var LoaNull:Boolean=false;
		
		public var logBj:Sprite;
		
		public var logimg:Sprite;
		public var clip:Clip;
		
		public var NRText:Text; 
		
		
		public var gotoNum:int=1;
		public var gotoTime:Timer;
		private var clipSkin:String = "assets/gamelogo/log/clip_log.png";
		
		public var _wz:String;
		
		public function yfqian_Loading(wz:String="加载中，请稍后..."):void
		{
			MaxUi.GameMaxUi.mouseEnabled=false;
			MaxUi.GameMaxUi.mouseThrough=false;
			_wz=wz;
			LoaNull=false;
			logBj=new Sprite();
			logBj.loadImage("assets/gamelogo/blank.png",0,0,yfqian_Data.MaxWidth,yfqian_Data.MaxHeight);
						
			clip=new Clip(clipSkin, 5, 1);
			clip.loadImage(clipSkin,0,0,75,75);
			clip.autoPlay=true;
			
			var w:Number=(Laya.stage.width-75)/2;
			var h:Number=(Laya.stage.height-75)/2-80;
			clip.pos(w,h);
	

			
			
			MaxUi.GameMaxUi.addChild(logBj);	
			logBj.addChild(clip);	
			
			LogEvent();
			//			logBj.timer.once(5000,this,off)
			
		}
		
		
		public function LogEvent():void{
			LoaNull=true;
			
			
			NRText=new Text();
			NRText.text = _wz;
			NRText.width=yfqian_Data.MaxWidth;
			NRText.fontSize = 24;
			NRText.align = "center";
			NRText.color = "#ffffff";
			NRText.pos(0,430);
			logBj.addChild(NRText);
			logBj.mouseEnabled=true;
			logBj.mouseThrough=true;

			
			
		}
		public function off():void{
			logBj.removeChild(NRText);
			logBj.removeChild(clip);	
			MaxUi.GameMaxUi.removeChild(logBj);	
			MaxUi.GameMaxUi.mouseEnabled=true;
			MaxUi.GameMaxUi.mouseThrough=true;
		}
	}
}