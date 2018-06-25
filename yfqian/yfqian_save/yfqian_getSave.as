package yfqian.yfqian_save
{
	

	public class yfqian_getSave
	{
		public function yfqian_getSave()
		{
		}
		public static function get(NameStr:String,Num:*=0):*{
			var getNum:*=yfqian_SaveALoad.get(NameStr);
			if(getNum==undefined||getNum==null){
				yfqian_SaveALoad.set(NameStr,Num);
				getNum=yfqian_SaveALoad.get(NameStr);
			}
			return getNum;
		}
		public static function set(NameStr:String,Num:int,NumMax:int,NumOf:Boolean=true):*{
			var getNum:*=yfqian_SaveALoad.get(NameStr);
			var setNum:*;
			if(NumOf==true){
				if((getNum+Num)<=(NumMax+1)){
					yfqian_SaveALoad.set(NameStr,String(getNum+Num));
					setNum=yfqian_SaveALoad.get(NameStr);
					return setNum;
				}else{
					yfqian_SaveALoad.del();
					GameOver();
					return false;
				}
			}else{
				if((getNum-Num)<=0){
					return false;
				}else{
					yfqian_SaveALoad.set(NameStr,String(getNum-Num));
					setNum=yfqian_SaveALoad.get(NameStr);
					return setNum;
				}
			}
		}
		
		public static function g_set(NameStr:String,Num:*):*{
			var getNum:*=yfqian_SaveALoad.get(NameStr);
			yfqian_SaveALoad.set(NameStr,Num);
			getNum=yfqian_SaveALoad.get(NameStr);
			
			return getNum;
		}
		public static function GameOver():void{
//			FirstBlood.DelSave();
		}
	}
}