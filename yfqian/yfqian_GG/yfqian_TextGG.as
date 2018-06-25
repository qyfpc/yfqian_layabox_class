package yfqian.yfqian_GG
{
	import laya.display.Sprite;
	import laya.display.Text;
	import laya.utils.Tween;
	
	import yfqian.init.yfqian_Data;

	public class yfqian_TextGG
	{		
		public var TextGG_MaxUi:Sprite;
		public var TextGG_Ui:Sprite;
		public var TextGG_Wz:Text;
		
		/**
		 * @param "1" 绿色
		 * @param "2" 蓝色
		 * @param "3" 橙色
		 * @param "4" 红色
		 * @param "5" 紫色
		 * @param "6" 灰色
		 * @param "7" 黄色
		 * @param "8" 天蓝色
		 */
		public function yfqian_TextGG(TextObj, ColorNum = 1,uiOn:Boolean=true,TextY=0,logOn:Boolean=false,logUi:Function=null)
		{
			if(logOn==true){
				logUi(true);
			}
			TextGG_Ui=new Sprite();
			Laya.stage.addChild(TextGG_Ui);
			var uiStr:String;
			if(uiOn==true){
				uiStr="assets/gamelogo/gg_logn.png";
			}else{
				uiStr="assets/gamelogo/gg_logn_null.png";	
			}
			
			
			TextGG_Ui.loadImage(uiStr);
		
				TextGG_Ui.pos((Main.MaxW-424)/2,Main.MaxH/2-80);
				TextGG_Ui.pivot(TextGG_Ui.width/2,TextGG_Ui.height/2);
				TextGG_Ui.x+=TextGG_Ui.width/2;
				TextGG_Ui.y+=TextGG_Ui.height/2;

				
				
				var ColorName:String;
				switch ( ColorNum )
				{
					case 1:
						ColorName = "#00FF00";//绿色
						break;
					case 2:
						ColorName = "#00CCFF";//蓝色
						break;
					case 3:
						ColorName = "#FF9933";//橙色
						break;
					case 4:
						ColorName = "#FF0000";//红色
						break;
					case 5:
						ColorName = "#FF00FF";//紫色
						break;
					case 6:
						ColorName = "#999999";//灰色
						break;
					case 7:
						ColorName = "#ffff00";//黄色
						break;
					case 8:
						ColorName= "#00ffff";//天蓝色
						break;
					default:
						ColorName= "#ffffff";
				}
				
				
				TextGG_Wz=new Text();
				TextGG_Wz.text = TextObj;
				TextGG_Wz.width=yfqian_Data.MaxWidth;
				TextGG_Wz.fontSize = 24;
				TextGG_Wz.stroke=2;
				TextGG_Wz.font = "楷体";
				TextGG_Wz.bold=true;
				TextGG_Wz.valign = "middle";
				TextGG_Wz.align = "center";
				TextGG_Wz.color = ColorName;
				TextGG_Wz.pos(-30,10);
				TextGG_Wz.stroke=2;
				TextGG_Ui.addChild(TextGG_Wz);
				
				
				TextGG_Ui.alpha=0;
				TextGG_Ui.scaleX=0;
				TextGG_Ui.scaleY=0;
				Tween.to(TextGG_Ui,{alpha:1},100);
				Tween.to(TextGG_Ui,{scaleX:1,scaleY:1},50);
				
				TextGG_Ui.timer.once(50,this,function():void {
					TextGG_Ui.timer.clearAll(this);
					Tween.to(TextGG_Ui,{ y:Main.MaxH/2-300 },1000);
					TextGG_Ui.timer.once(1500,this,function():void {
						TextGG_Ui.timer.clearAll(this);
						
						TextGG_Ui.removeChild(TextGG_Wz);
						Laya.stage.removeChild(TextGG_Ui);
						
					});
				});	
				

		}		
	}
}
