package yfqian.yfqian_DH
{
	import laya.ani.swf.MovieClip;
	
	import yfqian.init.setTimeout;
	
	public class yfqian_Mc_L
	{
		
		public function yfqian_Mc_L()
		{
		}
		public var play:Boolean=true;
		public var zMixNum:int
		public function toPlay(UIObj:MovieClip,zMix:int,zMax:int,stop:Boolean=false,type:Function=null,time:int=60):void{
			zMixNum=zMix;
			play=true;
			playOn();
			function playOn():void{
				if(zMixNum==zMax){
					UIObj.index=zMix;
					zMixNum=zMix;
				}else{
					UIObj.index=zMixNum	
				}
				
				zMixNum++
				if(zMixNum==zMax&&stop==true){
					play=false;
					type();
				}else if(play==true){
					setTimeout.on(playOn,time);
				}
				
				
			}
			
		}
		
		
	}
}