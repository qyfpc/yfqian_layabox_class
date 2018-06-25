package  yfqian{
    import laya.utils.Dictionary;
    
    public class yfqian_Dict extends DispatcherObject {

		public var dict:Dictionary;
		/**
		 * 创建数据字典
		 */
        public function yfqian_Dict(){
            this.dict = new Dictionary();
            
        }
		
		/**
		 * 获取键值对象
		 */
        public function get(key:Object):Object{
            return this.dict.get(key);
        }
		/**
		 * 存储键值对象
		 */
        public function set(key:Object, value:Object):Boolean{
            
            if (this.dict.get(key) == value){
                return false;
            }
            
            this.dict.set(key,value);
            
            return true;
        }
		
		/**
		 * 存储键值数字形式下，最大的一个对象
		 */
		public function push(value:Object):Array{
			var maxDict:Number=keys_max+1;
			if(maxDict==1&&length==0){
				maxDict=0;
			}
			this.dict.set(maxDict,value);
			
			return [maxDict,value];
		}
		/**
		 * 是否存在字典
		 */
		public function get isOnDict():Boolean{
			var isOn:Boolean=true;
			var maxDict:Number=keys_max+1;
			if(maxDict==1&&length==0){
				maxDict=0;
				isOn=false;
			}
			return isOn
			
		}
		/**
		 * 删除一个键值内容
		 */
        public function remove(key:Object):void{
            this.dict.remove(key);
            
        }
		/**
		 * 删除键值数据
		 */
		
        public function clearAll():void{
            var key:Object;
            for (key in this.dict) {
                
                delete this.dict[key];
            };
            
        }
		
		/**
		 * 删除第一个键值
		 */
		
		public function del_Min():void{
			var mixDict:Number=keys_min;
			this.dict.remove(mixDict);
		}
		/**
		 * 删除最后一个键值
		 */
		public function del_Max():void{
			var maxDict:Number=keys_max;
			this.dict.remove(maxDict);
		}
		
		/**
		 * 是否存在键值
		 */
        public function containsKey(key:Object):Boolean{
           return this.dict.indexOf(key)>=0;
        }
		/**
		 * 是否存在内容
		 */
        public function containsValue(value:Object):Boolean{
			return dict.values.indexOf(value)>=0;
             
        }
		
		/**
		 * 查找内容获取id
		 */
        public function find(value:Object):Object{
			var index:*=dict.values.indexOf(value);
			if(index<0){
				return null;
			}else{
				return dict.keys[index];
			}
        }
		/**
		 * 从大到小排列
		 */
		public function get desc():Object{
			
			return dict.keys.sort(compareFunction);
			
			function compareFunction(A:int,B:int):int
			{
				if(A<B)
				{
					return -1;
				}
				else if(A==B)
				{
					return 0;
				}
				else
				{
					return 1;
				}
			}
		}
		/**
		 * 从小到大排列
		 */
		public function get asc():Object{
			
			return dict.keys.sort(compareFunction);
			
			function compareFunction(A:int,B:int):int
			{
				if(A>B)
				{
					return -1;
				}
				else if(A==B)
				{
					return 0;
				}
				else
				{
					return 1;
				}
			}
		}
		

        public function getEnumerator():DictEnumerator{
            
            return (new DictEnumerator(this));
        }


        public function get keys():Array{
            return dict.keys;
        }
		/**
		 * keys当前最大值
		 */
		public function get keys_upMax():Number{
			var maxDict:Number=keys_max+1;
			if(maxDict==1&&length==0){
				maxDict=0;
			}
			return maxDict;
		}
		
		/**
		 * 获取最大的键值
		 */
		public function get keys_max():Number{
			var maxKeysNum:Number=0;;
//			maxKeysNum=dict.keys[length];
			for(var i:int=0;i<length;i++){
				if(dict.keys[i]!=null&&maxKeysNum<=dict.keys[i]){
					maxKeysNum=dict.keys[i];
				}
			}
			return maxKeysNum;
		}
		/**
		 * 获取最小的键值
		 */
		public function get keys_min():Number{
			var maxKeysNum:Number=0;;
			for(var i:int=0;i<length;i++){
				if(dict.get(i)!=null){
					maxKeysNum=i
					i=dict.keys.length;
				}
			}
			return maxKeysNum;
		}

        public function get values():Array{
           return dict.values;
        }
		/**
		 * 获取长度
		 */
        public function get length():uint{
            
            return dict.keys.length;
        }


    }

    
    
    
    
}//package rb.framework.data
