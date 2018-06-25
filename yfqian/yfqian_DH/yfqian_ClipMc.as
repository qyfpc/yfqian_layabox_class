package yfqian.yfqian_DH
{
	import yfqian.init.setTimeout;

	public class yfqian_ClipMc
	{
		public function yfqian_ClipMc()
		{
		}
		public var play:Boolean=true;
		public var zMixNum:int
		public function toPlay(UIObj:Object,zMix:int,zMax:int,time:int=60):void{
			
			UIObj.index=zMix;
			zMixNum=zMix;
			playOn();
			function playOn():void{
				if(zMixNum==zMax){
					UIObj.index=zMix;
					zMixNum=zMix;
				}else{
					UIObj.index=zMixNum	
				}
				zMixNum++
				if(play==true){
					setTimeout.on(playOn,time);
				}
			}
				
		}
		

	}
}