package yfqian.yfqian_GG
{
	import laya.display.Sprite;
	import laya.display.Text;
	import laya.events.Event;
	import laya.utils.Handler;
	import laya.utils.Tween;
	
	import yfqian.init.MaxUi;
	import yfqian.init.yfqian_Data;

	public class yfqian_UiGG
	{
		/**
		 * 
			var textObj:Object={
				TM:"游戏公告",
				NR:"游戏公告游戏公告游戏公告游戏公告游戏公告游戏公告游戏公告游戏公告"
			}
			new yfqian_UiGG(textObj,0,ceshi); 
			 * 默认为１，１个确认。
							
		 */
		public function yfqian_UiGG(textObj:Object,ms:int=1,gotoL:Function=null)
		{
			
			var Logna:Sprite=new Sprite();
			Logna.loadImage("assets/gamelogo/blank.png",0,0,yfqian_Data.MaxWidth,yfqian_Data.MaxHeight,new Handler(this,function():void{
			
				Logna.mouseEnabled=true;
				Logna.mouseThrough=true;

				
				MaxUi.GameMaxUi.addChild(Logna);	
				
				var UiGG:Sprite=new Sprite();
				var bjGG:Sprite=new Sprite();
				
				
				var AN_X:Sprite=new Sprite();
				var AN_QR:Sprite=new Sprite();
				var AN_QX:Sprite=new Sprite();
				
				
				var BT_WZ:Text=new Text();
				var NR_WZ:Text=new Text();
				
				UiGG.loadImage("assets/gamelogo/blank.png",0,0,yfqian_Data.MaxWidth,yfqian_Data.MaxHeight,new Handler(this,function():void{
					
					MaxUi.GameMaxUi.addChild(UiGG);			
					bjGG.loadImage("assets/gamelogo/gg_beijin.png",0,0,0,0,new Handler(this,function():void{
						MaxUi.GameMaxUi.addChild(bjGG);
						
						bjGG.on(Event.MOUSE_DOWN,this,ButtonTouch);
						
						bjGG.pivot(yfqian_Data.MaxWidth/2,yfqian_Data.MaxHeight/2);
						bjGG.pos(yfqian_Data.MaxWidth/2,yfqian_Data.MaxHeight/2);
						
						bjGG.x=(yfqian_Data.MaxWidth/2)+40;
						bjGG.y=(yfqian_Data.MaxHeight/2)+200;
						
						bjGG.mouseEnabled=true;	
						//			bjGG.mouseThrough=true;
						
						AN_X.loadImage("assets/gamelogo/gg_x.png");
						bjGG.addChild(AN_X);
						AN_X.pos(400,-10);
						AN_X.mouseEnabled=true;
						AN_X.name="anx";
						
						
						AN_QR.loadImage("assets/gamelogo/gg_qr.png");
						
						AN_QR.pos(80,370);
						AN_QR.mouseEnabled=true;
						AN_QR.name="anqr";
						
						bjGG.addChild(AN_QR);
						
						
						AN_QX.loadImage("assets/gamelogo/gg_qx.png");
						
						AN_QX.pos(280,370);
						AN_QX.mouseEnabled=true;
						AN_QX.name="anqx";
						
						bjGG.addChild(AN_QX);
						
						
						
						BT_WZ=new Text();
						BT_WZ.text = textObj.TM;
						BT_WZ.width=yfqian_Data.MaxWidth;
						BT_WZ.fontSize = 32;
						BT_WZ.align = "center";
						BT_WZ.pos(-40,20);
						BT_WZ.color ="#ffffff";
						BT_WZ.stroke = 2;
						BT_WZ.strokeColor = "#000000";
						bjGG.addChild(BT_WZ);
						
						
						NR_WZ=new Text();
						NR_WZ.text = textObj.NR;
						NR_WZ.width=420;
						NR_WZ.fontSize = 24;
						NR_WZ.align = "left";
						NR_WZ.pos(30,80);
						NR_WZ.wordWrap = true;
						NR_WZ.color ="#ffffff";
						bjGG.addChild(NR_WZ);
						
						if(ms==1){
							AN_QX.visible=AN_X.visible=false;
							AN_QR.x=170;
						}
						
						OnVis(bjGG);
						
						//			MaxUi.GameMaxUi.setChildIndex(UiGG,MaxUi.GameMaxUi.numChildren-1);
						
						function ButtonTouch(e:Event):void
						{
							trace("按钮1",e.target.name );
							
							if(ms==1){
								if(e.target.name=="anqr"){
									ButtonQR();
								}
							}else{
								if(e.target.name=="anx"){
									ButtonX();
								}else if(e.target.name=="anqr"){
									ButtonQR();
								}else if(e.target.name=="anqx"){
									ButtonQX();
								}
								
							}
							
						}
						function ButtonX():void{
							//				trace("关闭");
							OffVis(bjGG);
						}
						function ButtonQR():void{
							//				trace("确认");			
							OffVis(bjGG,true);
						}
						function ButtonQX():void{
							//				trace("取消");
							OffVis(bjGG);
						}
						
						var Vis_Null:Boolean=true;
						function OnVis(UiNiuObj:Sprite,gotoL_s:Boolean=false):void {//移动层，关闭层
							Vis_Null=true;
							UiNiuObj.scaleX = UiNiuObj.scaleY = 0.1;
							
							Tween.to(UiNiuObj,{scaleX: 1.2, scaleY: 1.2 },300);
							
							UiNiuObj.timer.once(300,this,function():void {
								UiNiuObj.timer.clearAll(this);
								Tween.to( UiNiuObj,{ scaleX: 1, scaleY: 1 },100);
								
								UiNiuObj.timer.once(100,this,function():void {
									UiNiuObj.timer.clearAll(this);
									Tween.to( UiNiuObj,{ scaleX: 1.04, scaleY: 1.04 },100);
									UiNiuObj.timer.once(100,this,function():void {
										UiNiuObj.timer.clearAll(this);
										Vis_Null=false;
										Tween.to( UiNiuObj,{scaleX: 1, scaleY: 1 },100);
										
									});
								});
							});
							
						}
						
						function OffVis(UiNiuObj:Sprite,gotoL_s:Boolean=false):void {//移动层，关闭层
							if(Vis_Null == false) {
								bjGG.off(Event.MOUSE_DOWN,this,ButtonTouch);
								
								UiNiuObj.scaleX = UiNiuObj.scaleY = 1;
								
								Tween.to( UiNiuObj,{scaleX: 1.08, scaleY:1.08 },200);
								UiNiuObj.timer.once(200,this,function():void {
									UiNiuObj.timer.clearAll(this);
									Tween.to( UiNiuObj,{scaleX: 0, scaleY: 0 },100);
									UiNiuObj.timer.once(100,this,function():void {
										UiNiuObj.timer.clearAll(this);
										bjGG.removeChild(NR_WZ);
										bjGG.removeChild(BT_WZ);
										bjGG.removeChild(AN_QX);
										bjGG.removeChild(AN_QR);
										bjGG.removeChild(AN_X);
										MaxUi.GameMaxUi.removeChild(bjGG);
										MaxUi.GameMaxUi.removeChild(UiGG);	
										
										if(gotoL!=null&&gotoL_s==true){
											gotoL();
										}
										MaxUi.GameMaxUi.removeChild(Logna);	
									});
								});
								
							}
						}
					}));
				}));
				
			}));
		}
				
	}
}