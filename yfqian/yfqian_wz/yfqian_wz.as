package yfqian.yfqian_wz
{
	import laya.display.Text;
	import laya.events.Event;

	public class yfqian_wz
	{
		private var txt:Text;
		private var prevX:Number = 0;
		private var prevY:Number = 0;
		private var gdbarskin:String;
		//bgborder是边距
		public function yfqian_wz(textui:*,scrollbarskin:String="all",bgborder:int=0)
		{
			gdbarskin=scrollbarskin;
			createText();	
			function createText():void
			{
				txt = new Text();
				txt.overflow = Text.SCROLL;
				txt.text=textui.text;
				textui.text="";
				txt.size(textui.width-(bgborder*2), textui.height-(bgborder*2));
				txt.x = bgborder;
				txt.y = bgborder;
				txt.valign="top";//置顶
//				txt.borderColor = "#FFFF00";
//				txt.borderColor = "";
				txt.wordWrap=true;
				txt.fontSize = 20;
				txt.color = "#ffffff";
				
				textui.addChild(txt);
				
				txt.on(Event.MOUSE_DOWN, this, startScrollText);
			}
			
			/* 开始滚动文本 */
			function startScrollText(e:Event):void
			{
				if(scrollbarskin=="all"||scrollbarskin=="v"){
					prevX = txt.mouseX;
				}
				if(scrollbarskin=="all"||scrollbarskin=="h"){
					prevY = txt.mouseY;
				}

				
				Laya.stage.on(Event.MOUSE_MOVE, this, scrollText);
				Laya.stage.on(Event.MOUSE_UP, this, finishScrollText);
			}
			
			/* 停止滚动文本 */
			function finishScrollText(e:Event):void
			{
				Laya.stage.off(Event.MOUSE_MOVE, this, scrollText);
				Laya.stage.off(Event.MOUSE_UP, this, finishScrollText);
			}
			
			/* 鼠标滚动文本 */
			function scrollText(e:Event):void
			{
				var nowX:Number = txt.mouseX;
				var nowY:Number = txt.mouseY;
				
				
				if(scrollbarskin=="all"||scrollbarskin=="v"){
					txt.scrollX += prevX - nowX;
					prevX = nowX;
				}
				if(scrollbarskin=="all"||scrollbarskin=="h"){
					txt.scrollY += prevY - nowY;
					prevY = nowY;
				}
			}
			
		}

		public function get text():String {
			return txt.text;
		}	
		public function set text(value:String):void {
			txt.text=value;
			
			//从底部开始向上     类似聊天工具	
//			if(gdbarskin=="all"||gdbarskin=="v"){
//				txt.scrollX = txt.maxScrollX
//			}
//			if(gdbarskin=="all"||gdbarskin=="h"){
//				txt.scrollY = txt.maxScrollY
//			}
		}	
		public function set borderColor(value:String):void {
			txt.borderColor = value;
		}	
		public function set color(value:String):void {
			txt.color = value;
		}	
		public function set fontSize(value:int):void {
			txt.fontSize = value;
		}	
		public function set wordWrap(value:Boolean):void {
			txt.wordWrap = value;
		}	
		public function set valign(value:String):void {
			txt.valign = value;
		}
		public static function text(char:String):String{
			var str:String = char.replace(/([  ]{1})/g,"");	
			return str;
		}
		
		public static function format(char:Number,ws:Number):String{
			var gkGold:Number=char;
			var gkGoldText:String=String(Math.ceil(gkGold));
			var gkMax:int=2;
			if(gkGold>=10000){
				gkGold=gkGold/10000;
				gkGoldText=gkGold.toFixed(2);
				if(gkGoldText[gkGoldText.length-1]==0){
					gkMax=1;
					if(gkGoldText[gkGoldText.length-2]==0&&ws==2){
						gkMax=0;
					}
				}
				gkGoldText=gkGold.toFixed(gkMax)+"万";
			}
			
			return gkGoldText;
		}
		public static function format_one(char:Number,wz:Number=2,num:int=10000,ts:String="万"):String{
			var gkGold:Number=char;
			var gkGoldText:String=String(gkGold);
			var gkMax:int=1;
			if(wz==1){
				gkGold=Math.floor(gkGold/(num/1000)/100)/10;
			}else{
				gkGold=Math.floor(gkGold/(num/100))/100;
			}
			gkGoldText=gkGold+ts;
			
			return gkGoldText;
		}
		public static function yfqian_fs(num:String):String
		{
			var numMax:String=num;
			numMax=numMax.replace(/(\d)(?=(\d\d\d)+$)/g, "$1,");
			return numMax;
		}
		/**
		 * 文字保留位数方法。
		 * @param	返回：String 字符串。
		 * @param	txt：文字（必须）。
		 * @param	numMax：限制数量，默认5。
		 * @param	v：文字带一个返回效果，默认空。
		 * @param	参考升序：yfqian_wz.name_maxChars(文字，数量)。
		 * @author yfqian
		 */
		public static function name_maxChars(txt:String,numMax:int=5,v:String=""):String
		{
			var txtMax:int=txt.length;
			var txtWz:String=txt;
			if(txtMax<=numMax-1){
				numMax=txtMax;
			}
			txt="";
			for(var i:int=0;i<numMax;i++){
				txt=txt+txtWz[i]
			}
		
			return txt+v;
		}

	}
}