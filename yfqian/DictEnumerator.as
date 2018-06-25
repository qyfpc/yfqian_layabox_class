package  yfqian{ 
    public class DictEnumerator {

        protected var sourceDict:yfqian_Dict;
        protected var keys:Array;
        protected var cursor:uint;

        public function DictEnumerator(dict:yfqian_Dict){
            
            this.sourceDict = dict;
            
            this.reset();
            
        }

        public function get isEnd():Boolean{
            
            if (this.keys.length == 0){
                return (true);
            };
            
            if (this.cursor >= (this.keys.length - 1)){
                return (true);
            };
            
            return (false);
        }

        public function moveNext():void{
            
            this.cursor++;
            
        }

        public function reset():void{
            
            this.keys = this.sourceDict.keys;
            
            this.cursor = 0;
            
        }

        public function get current():Object{
            
            return (this.sourceDict[this.keys[this.cursor]]);
        }


    }

    
    
    
    
}//package rb.framework.data
