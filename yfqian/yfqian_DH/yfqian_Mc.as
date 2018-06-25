package yfqian.yfqian_DH
{
	
	
	public class yfqian_Mc
	{
		
		public function yfqian_Mc()
		{
		}
		public var play:Boolean=true;
		public var zMixNum:int;
		public var set_Mix:int;
		public var set_Max:int;
		public var _data:*;
		public var _UIObj:Object;
		public var set_time:int;
		public var fb:Boolean=false;
		public var _stop:Boolean;
		public function toPlay(UIObj:Object,zMix:int,zMax:int,stop:Boolean=false,data:Function=null,time:int=60):void{
			_stop=stop;
			fb=false;
			UIObj.index=zMix;
			_UIObj=UIObj
			set_time=time;
			zMixNum=zMix;
			set_Mix=zMix;
			set_Max=zMax;
			//			_data=data;
			playOn(data);

			
		}
		public function playOn(data:Function):void{
			if(zMixNum==set_Max){
				data();
				_UIObj.index=set_Mix;
				zMixNum=set_Mix;
				if(_stop==true){
					fb=true;
					OffTime();
				}
			}else{
				_UIObj.index=zMixNum	
			}
			zMixNum++
			if(play==true){
				fb=true;
				_UIObj.timer.once(set_time,this,function ():void{
					playOn(data);
				});
			}
		}
		public function OffTime():void{
			if(fb==true){
				_UIObj.timer.clearAll(this);
			}
		}
//		public function yfqian_Mc()
//		{
//		}
//		public var play:Boolean=true;
//		public var zMixNum:int
//		public function toPlay(UIObj:MovieClip,zMix:int,zMax:int,stop:Boolean=false,type:Function=null,time:int=60):void{
//			zMixNum=zMix;
//			play=true;
//			playOn();
//			function playOn():void{
//				if(zMixNum==zMax){
//					UIObj.index=zMix;
//					zMixNum=zMix;
//				}else{
//					UIObj.index=zMixNum	
//				}
//				
//				zMixNum++
//				if(zMixNum==zMax&&stop==true){
//					play=false;
//					type();
//				}else if(play==true){
//					setTimeout.on(playOn,time);
//				}
//				
//				
//			}
//			
//		}
		
		
	}
}