package yfqian.yfqian_GG
{
	import laya.display.Sprite;
	import laya.display.Text;
	import laya.utils.Handler;
	import laya.utils.Tween;
	
	import yfqian.init.MaxUi;
	import yfqian.init.yfqian_Data;
	
	public class yfqian_TextGG_OffUi
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
		public function yfqian_TextGG_OffUi(TextObj, ColorNum = 1,TextY=250,logOn:Boolean=false,logUi:Function=null)
		{
			if(logOn==true){
				logUi(true);
			}
			TextGG_Ui=new Sprite();
			MaxUi.LTMaxUi.addChild(TextGG_Ui);

			TextGG_Ui.zOrder=2001;
			TextGG_Ui.loadImage("assets/gamelogo/gg_logn_null.png",0,0,0,0,new Handler(this,function():void{
			
				TextGG_Ui.pos((Main.MaxW-424)/2,TextY);
				TextGG_Ui.pivot(TextGG_Ui.width/2,TextY/2);
				TextGG_Ui.x+=TextGG_Ui.width/2;
				TextGG_Ui.y+=TextGG_Ui.height/2;
				TextGG_Ui.scaleX=0.01;
				TextGG_Ui.scaleY=0.01;
				
				var UiY:int=TextGG_Ui.y-150;
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
				TextGG_Wz.align = "center";
				TextGG_Wz.color = ColorName;
				TextGG_Wz.valign = "bottom";
				TextGG_Wz.font="楷体";
				TextGG_Wz.stroke=2;
				TextGG_Wz.bold=true;
				TextGG_Wz.pos(-65,0);
				TextGG_Wz.stroke=2;
				TextGG_Ui.addChild(TextGG_Wz);
				
				
				TextGG_Ui.alpha=1;
				TextGG_Ui.scaleX=0.4;
				TextGG_Ui.scaleY=0.4;
//				TextGG_Ui.y+=20;
//				Tween.to(TextGG_Ui,{alpha:0.8},300);
				Tween.to(TextGG_Ui,{scaleX:1,scaleY:1,alpha:0.8},400);
				TextGG_Ui.timer.once(400,this,function():void {
					Tween.to(TextGG_Ui,{ y:UiY,alpha:1 },1500);
				
					TextGG_Ui.timer.once(1500,this,function():void {
						TextGG_Ui.timer.clearAll(this);
						TextGG_Ui.removeChild(TextGG_Wz);
						MaxUi.LTMaxUi.removeChild(TextGG_Ui);
					});
	
				});	
			}));
		}
	}
}

