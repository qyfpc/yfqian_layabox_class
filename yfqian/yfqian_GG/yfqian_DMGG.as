package yfqian.yfqian_GG
{
	import laya.display.Sprite;
	import laya.display.Text;
	import laya.utils.Tween;
	
	import yfqian.init.MaxUi;
	import yfqian.init.yfqian_Data;

	public class yfqian_DMGG
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
		public function yfqian_DMGG(TextObj:String,ColorNum:Number=6,logOn:Boolean=false,logUi:Function=null)
		{
			if(logOn==true){
				logUi(true);
			}
			TextGG_Ui=new Sprite();
			MaxUi.GameMaxUi.addChild(TextGG_Ui);
			
	
//			TextGG_Ui.loadImage("assets/gamelogo/gg_logn.png");	
//				TextGG_Ui.pos((Main.MaxW-424)/2,Main.MaxH/2-80);
//				TextGG_Ui.pivot(TextGG_Ui.width/2,TextGG_Ui.height/2);
//				TextGG_Ui.x+=TextGG_Ui.width/2;
//				TextGG_Ui.y+=TextGG_Ui.height/2;

//				var ColorNum:int=Math.round(Math.random()*(8-1)+1);		
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
						ColorName = "#ffffff";//白色
						break;
					case 7:
						ColorName = "#ffff00";//黄色
						break;
					case 8:
						ColorName= "#00ffff";//天蓝色
						break;
					default:
						ColorName= "#999999";//灰色
				}
				
				
				TextGG_Wz=new Text();
				TextGG_Wz.text = TextObj;
				TextGG_Wz.width=yfqian_Data.MaxWidth;
				TextGG_Wz.fontSize = 24;
				TextGG_Wz.align = "center";
				TextGG_Wz.color = ColorName;
				
				TextGG_Wz.stroke = 2;
				TextGG_Wz.strokeColor = "#000000";
				
				var sj_H:int=Math.round(Math.random()*(Main.MaxH/3.5-10)+10);
				var sj_T:int=Math.round(Math.random()*(15000-5000)+5000);
				TextGG_Wz.pos(Main.MaxW,sj_H);
				
				TextGG_Ui.addChild(TextGG_Wz);
				

				Tween.to(TextGG_Wz,{ x:-800 },sj_T);
				TextGG_Ui.timer.once(sj_T,this,function():void {
					TextGG_Ui.timer.clearAll(this);
					
					TextGG_Ui.removeChild(TextGG_Wz);
					MaxUi.GameMaxUi.removeChild(TextGG_Ui);
					
				});

				

		}
	}
}
