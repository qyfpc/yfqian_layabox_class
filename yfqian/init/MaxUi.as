package yfqian.init{
	import laya.display.Sprite;

	public class MaxUi {
		public static var GameMaxUi:Sprite;
		public static var GameUi:Sprite;
		public static var GameList:Sprite;
		public static var GameGSUi:Sprite;
		public static var GameLoadingUi:Sprite;
		public static var LTMaxUi:Sprite;
		public function MaxUi(){
			
		}
		public static function startOn():void{
			trace("创建成功");
			GameMaxUi=new Sprite();
			GameUi=new Sprite();
			GameList=new Sprite();
			GameGSUi=new Sprite();
			GameLoadingUi=new Sprite();
			LTMaxUi=new Sprite();
		}
	}
}