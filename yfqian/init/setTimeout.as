package yfqian.init
{
	public class setTimeout
	{
		/**
		 * @param 执行域有问题，执行函数内有用到this，肯定报错,所以，如果报错传递this。
		 */
		public static function on(method:Function,delay:int,caller:*=null,obj:Object=null):void{

			if(caller==null){
				if(obj==null){
					Laya.stage.timer.once(delay,Laya.stage,method);
				}else{
					obj.timer.once(delay,Laya.stage,method);
				}
			}else{
				if(obj==null){
					Laya.stage.timer.once(delay,caller,method);
				}else{
					obj.timer.once(delay,caller,method);
				}
			}

		}
		public static function off(method:Function,caller:*=null,obj:Object=null):void{
			if(caller==null){
				if(obj==null){
					Laya.stage.timer.clear(Laya.stage, method);
				}else{
					obj.timer.clear(Laya.stage, method);
				}
			}else{
				if(obj==null){
					Laya.stage.timer.clear(caller, method);
				}else{
					obj.timer.clear(caller, method);
				}
			}
			
		}
		public static function offAll(caller:*=null,obj:Object=null):void{
			
			if(caller==null){
				if(obj==null){
					Laya.stage.timer.clearAll(Laya.stage);
				}else{
					obj.timer.clearAll(Laya.stage);
				}
			}else{
			
				if(obj==null){
					Laya.stage.timer.clearAll(caller);
				}else{
					obj.timer.clearAll(caller);
				}
			}

			
		}
	}
}