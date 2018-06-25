package yfqian.init{

	
	import laya.html.dom.HTMLDivElement;
	import laya.ui.View;
	import laya.utils.Handler;
	
	import yfqian.init.res.FirstBlood;
	import yfqian.init.res.Game_List;
	import yfqian.yfqian_GG.yfqian_TextGG;
	
	

	public class Ui_02_MornUiLog{
		public static var OnUiMorn:Boolean;
		public function Ui_02_MornUiLog()
		{
			Ui_02_MornUiLog.OnUiMorn=false;
			Laya.loader.load(Game_List.Arr, Handler.create(this, onLoaded));
				
		}
		
		private function onLoaded():void {
			View.regComponent("HTMLDivElement",HTMLDivElement);
			var vs:yfqian_TextGG=new yfqian_TextGG("")
			vs.TextGG_Ui.visible=false;
			Ui_02_MornUiLog.OnUiMorn=true;
			new FirstBlood();
		}
	}
}
