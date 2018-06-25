package  yfqian{
	 
    
    import laya.events.Event;
    import laya.events.EventDispatcher;
	

    public class DispatcherObject extends EventDispatcher {

        public function DispatcherObject(){
            
        }

        public function clone():Object{
            
            
            
            return (null);
        }

        public function equals(other:Object):Boolean{
            
            
            
            
            return other === this;
        }
		public function dispatchEvent(e:Event):void{
			super.event(e.type,e);
			
		}

        public function addEventListener(type:String,caller:*, listener:Function):void{
            
            
            
            super.on(type,caller, listener);
            
        }

        public function removeEventListener(type:String,caller:*, listener:Function ):void{
            
            
            super.off(type,caller, listener);
            
        }

        public function clearEventListener():void{
            
            
            
        }

        protected function toValueString():String{
            
            
            
            return ("");
        }

        public function toString():String{
            
            var className:String = "";//getQualifiedClassName(this);
            
            var sep:int = className.indexOf("::");
            
            if (sep >= 0){
                
                className = className.substr(sep + 2);
            };
            
            var valueString:String = this.toValueString();
            
            if (valueString != ""){
                valueString = (" " + valueString);
            };
            
            return (("[" + className) + valueString) + "]";
        }

	 
		public function fromObject(objectSrc:Object):*{
			//orgdata = objectSrc;
			var p:String; 
			if (!objectSrc){
				return;
			} 
			for(p in objectSrc){

				if (this.hasOwnProperty(p))
				{
					try
					{
						//格式化预处理
						if (this.hasOwnProperty("f_" + p)) {
							this["f_"+p](objectSrc[p])
						}else {
							this[p]=objectSrc[p];
						}
					}
					catch (err:Error)
					{
					}
				}
			}
			return this;
		}
    }

    
    
    
    
}//package rb.framework.data
