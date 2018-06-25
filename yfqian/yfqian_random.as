package yfqian
{
	public class yfqian_random
	{
		public function yfqian_random()
		{
		}
		/**
		 * 随机数组内容。
		 * @param	arr 数组。
		 * @param	参考升序：yfqian_random.array(arr)。
		 * @author yfqian
		 */
		public static function array(arr:Array):*{
			return arr.sort(randomsort)
			function randomsort(a, b):* {
				return Math.random()>.5 ? -1 : 1;
				//用Math.random()函数生成0~1之间的随机数与0.5比较，返回-1或1
			}
		}
		public static function array_b(arr:Array):*{//从大到小
			return arr.sort(randomsort)
			function randomsort(a, b):* {
				return a>b?-1:1;
				//用Math.random()函数生成0~1之间的随机数与0.5比较，返回-1或1
			}
		}
		
		/**
		 * 打乱数组内容。
		 * @param	arr 数组。
		 * @param	参考升序：yfqian_random.random_Array(arr)。
		 * @author yfqian
		 */	
		
		public static function random_Array(arr:Array):Array {
			
			return arr.sort(random_fun);
			
			function random_fun(a:*, b:*):int {
				
				if (Math.random() < 0.5) {
					
					return -1;
					
				}
				
				return 1;
				
			}
			
		}
		public static function laya_pl(arr:Array,wzInt:int,pxType:int=1):Array{
			var getArr:Array=[];
			var i:int=arr.length, j:int, temp:*;
			while(--i){
				for(j=0; j<i; j++){
					if(Number(arr[j][wzInt])> Number(arr[j+1][wzInt])){
						temp=arr[j];
						arr[j]=arr[j+1];
						arr[j+1]=temp;
					}
				}
			}
			
			if(pxType==1){
				for(i=0;i<arr.length;i++){
					getArr.push(arr[(arr.length-1)-i]);
					
				}
			}else{
				getArr=arr;
			}
			return getArr;
			
		}
		
		public static function laya_object3(arr:Array,name:String,pxType:int=1):Array{
			var getArr:Array=[];
			var ArrA:Array=[];
			var ArrB:Array=[];
			ArrA[0]=0;
			ArrB[0]=0;
			var i:int;
				
			for(i=0;i<arr.length;i++){
				if(arr[i]["huang_guan"].visible==true){
					ArrA[0]=1;
					ArrA.push(arr[i]);
				}else if(arr[i]["huang_guan"].visible==false){
					ArrB[0]=1;
					ArrB.push(arr[i]);
				}
			}
			if(ArrA[0]==1){
		
				ArrA=yfqian_Array.del(ArrA,0);

				ArrA=laya_object(ArrA,name,pxType);
				for(i=0;i<ArrA.length;i++){
					getArr.push(ArrA[i]);
				}
			}
			if(ArrB[0]==1){

				ArrB=yfqian_Array.del(ArrB,0);
				ArrB=laya_object(ArrB,name,pxType);
				for(i=0;i<ArrB.length;i++){
					getArr.push(ArrB[i]);
				}
			}
			
			return getArr;
			
		}
		/**
		 * 排序数组对象。
		 * @param	arr 数组。
		 * @param	name 排序值。
		 * @param	pxType 1降序，2升序 （默认降序）。
		 * @param	参考升序：yfqian_random.object(arr,"kid",2)。
		 * @author yfqian
		 */
		public static function object(arr:Array,name:String,pxType:int=1):Array{
			var getArr:Array=[];
			var i:int=arr.length, j:int, temp:*;
			while(--i){
				for(j=0; j<i; j++){
					if(arr[j][name]> arr[j+1][name]){
						temp=arr[j];
						arr[j]=arr[j+1];
						arr[j+1]=temp;
					}
				}
			}
			if(pxType==1){
				for(i=0;i<arr.length;i++){
					getArr.push(arr[(arr.length-1)-i]);
				}
			}else{
				getArr=arr;
			}
			return getArr;
		}
		
		/**
		 * 针对layalist的对象数组排序。
		 * @param	arr 数组。
		 * @param	name 排序值。
		 * @param	pxType 1降序，2升序 （默认降序）。
		 * @param	参考升序：yfqian_random.laya_object(arr,"kid",2)。
		 * @author yfqian
		 */
		public static function laya_object(arr:Array,name:String,pxType:int=1):Array{
			var getArr:Array=[];
			var i:int=arr.length, j:int, temp:*;
			while(--i){
				for(j=0; j<i; j++){
					if(Number(arr[j][name].text)>Number( arr[j+1][name].text)){
						temp=arr[j];
						arr[j]=arr[j+1];
						arr[j+1]=temp;
					}
				}
			}
			
			if(pxType==1){
				for(i=0;i<arr.length;i++){
					getArr.push(arr[(arr.length-1)-i]);
					
				}
			}else{
				getArr=arr;
			}
			return getArr;
		}
		
		
		public static function laya_object2(arr:Array,name:*,pxType:int=1):Array{
			var getArr:Array=[];
			var i:int=arr.length, j:int, temp:*;
			while(--i){
				for(j=0; j<i; j++){
					if(Number(arr[j][name])> Number(arr[j+1][name])){
						temp=arr[j];
						arr[j]=arr[j+1];
						arr[j+1]=temp;
					}
				}
			}
			
			if(pxType==1){
				for(i=0;i<arr.length;i++){
					getArr.push(arr[(arr.length-1)-i]);
					
				}
			}else{
				getArr=arr;
			}
			return getArr;
		}

	}
}