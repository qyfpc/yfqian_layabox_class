package yfqian.init
{
	import laya.display.Sprite;
	import laya.display.Text;
	import laya.ui.ProgressBar;
	import laya.utils.Handler;
	import laya.utils.Timer;
	
	import yfqian.yfqian_name.yfqian_NameList;
	

	public class Ui_01_Loading
	{
		public function Ui_01_Loading(GoTo_Name:Object){
			
			var JDMaxNum:int;
			var JDNum:int=1;
			var JDDQNum:int=0;
			var JDTime:Timer;
			var JDTimeNum:int;
			//			var jdmask:Shape;
			var JDText:Text; 
			var clientNum:Text;
			var serverNum:Text;
			var progressBar:ProgressBar;
			var beijin:Sprite = new Sprite();
			
			Laya.loader.load(["assets/gamelogo/ld_logo.png", "assets/gamelogo/ld_logo$bar.png"], Handler.create(this, onLoadComplete));
			var valueTime:int=300;
			function onLoadComplete():void{
				

			
	
			new yfqian_NameList();
			beijin.loadImage("assets/gamelogo/ld_beijing.jpg");
			MaxUi.GameLoadingUi.addChild(beijin);
			JDText = new Text();
			JDText.text = "资源加载中... " + JDNum + "%";
			JDText.bold=true;
			JDText.stroke=2;
			JDText.width=yfqian_Data.MaxWidth;
			JDText.y=yfqian_Data.MaxHeight-38;
			JDText.fontSize = 18;
			JDText.font = "楷体";
			JDText.align = "center";
			JDText.color = "#ffffff";
			MaxUi.GameLoadingUi.addChild(JDText);
			
			
			clientNum=new Text();
			clientNum.text = "客户端版本："+yfqian_Data.clientNum;
			clientNum.width=yfqian_Data.MaxWidth;
			clientNum.bold=true;
			clientNum.stroke=2;
			clientNum.x=10;
			clientNum.fontSize = 18;
			clientNum.font = "楷体";
			clientNum.align = "left";
			clientNum.color = "#ffffff";
			clientNum.y=yfqian_Data.MaxHeight-70;
			MaxUi.GameLoadingUi.addChild(clientNum);
			
			serverNum=new Text();
			serverNum.text = "服务端版本："+yfqian_Data.serverNum;
			serverNum.width=yfqian_Data.MaxWidth;
			serverNum.bold=true;
			serverNum.stroke=2;
			serverNum.x=clientNum.x;
			serverNum.fontSize = 18;
			serverNum.font = "楷体";
			serverNum.align = "left";
			serverNum.color = "#ffffff";
			serverNum.y=clientNum.y+22;
			MaxUi.GameLoadingUi.addChild(serverNum);
			new Ui_02_MornUiLog();
//			ld_logot.timer.frameonce(20, this, JDEvent);
			serverNum.visible=clientNum.visible=false;
			
				progressBar = new ProgressBar("assets/gamelogo/ld_logo.png");
				progressBar.pos(0, yfqian_Data.MaxHeight-16);
				
				progressBar.width = 540;
				
				progressBar.sizeGrid = "5,5,5,5";
				MaxUi.GameLoadingUi.addChild(progressBar);
				progressBar.value=0;
				progressBar.timer.once(valueTime, this, changeValue);
//				progressBar.timer.currTimer=200;
			}

			
			function changeValue():void
			{

				JDNum++
				progressBar.value =(JDNum/100);

				if(Ui_02_MornUiLog.OnUiMorn==false){
					if ( JDNum>= 0 && JDNum<= 30 ) {
						valueTime  = Math.round( Math.random() * ( 50 - 10 ) + 10 );
					} else if ( JDNum>= 31 && JDNum<= 60 ) {
						valueTime= Math.round( Math.random() * ( 1000 - 50 ) + 50 );
					} else if ( JDNum>= 61 && JDNum<= 80 ) {
						valueTime = Math.round( Math.random() * ( 8000 - 2000 ) + 2000 );
					} else if ( JDNum>= 81 && JDNum<=90 ) {
						valueTime = Math.round( Math.random() * ( 10000 - 5000 ) + 5000 );
					} else if ( JDNum>= 91 && JDNum<= 98 ) {
						valueTime = 10000;
					}else {
						JDNum= 99;	
						__JS__('location.reload()');
					}
					progressBar.timer.once(valueTime, this, changeValue);
				}else {
					if(JDNum>=100){
						progressBar.value=1;
						JDNum=100;
						
						Laya.stage.timer.once(200,this,function():void{
							offUi();
							Laya.stage.timer.clearAll(this);
							new GoTo_Name();
						});
					
					}else{
						JDNum++;
						valueTime=5;
						progressBar.timer.once(valueTime, this, changeValue);
					}
				}
				JDText.text = "资源加载中... " + Math.floor(JDNum) + "%";
			
			}

			function offUi():void{
				progressBar.timer.clearAll(this);
				MaxUi.GameLoadingUi.removeChild(beijin);
				MaxUi.GameLoadingUi.removeChild(JDText);
				MaxUi.GameLoadingUi.removeChild(clientNum);
				MaxUi.GameLoadingUi.removeChild(serverNum);
				MaxUi.GameLoadingUi.removeChild(progressBar);
				MaxUi.GameMaxUi.removeChild(MaxUi.GameLoadingUi);
				
			}

		}		
	}
}