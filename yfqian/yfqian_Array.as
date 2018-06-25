package yfqian
{
	public class yfqian_Array
	{
		/**
		 * 用于删除某个数组中的元素 
		 * @param var arr:Array =["a", "b", "c", "d"];
		 * @param arr=yfqian_Array.del(arr,2);
		 * @param ArrObj：数组
		 * @param intNum：算出数组元素位置
		 * @return arr=yfqian_Array.del(arr,2);
		 * @author yfqian
		 */

		public static function del(ArrObj:Array,intNum:Number):Array{
			delete ArrObj[intNum];
			for(var i:int = 0; i < ArrObj.length; i++) {
				if(ArrObj[i] == undefined) {
					ArrObj.splice(i, 1);
					i--;
				}
			}
			var getArr:Array=ArrObj;
			return getArr
		}
		
		/**
		 * 用于删除某个数组中的元素 
		 * @param var arr:Array =["a", "b", "c", "d"];
		 * @param arr=yfqian_Array.random(arr);
		 * @param ArrObj：数组
		 * @return arr=yfqian_Array.random(arr,2);
		 * @author yfqian
		 */
		
		public static function random(ArrObj:Array):Array{
			var newArr:Array = [];  
			while (ArrObj.length > 0)  
			{  
				newArr.push(ArrObj.splice(Math.floor(Math.random() * ArrObj.length),1)[0]);  
			}  
			return newArr;  
		}
	}
}
