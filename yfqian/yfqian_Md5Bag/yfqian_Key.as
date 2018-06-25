package yfqian.yfqian_Md5Bag
{
	public class yfqian_Key
	{
		public function yfqian_Key()
		{
		}
		public static function setKey(code:*):String  
		{    
			code=String(code)
			var c:String =String.fromCharCode(code.charCodeAt(0)+code.length);  
			for(var i:int=1;i<code.length;i++){  
				c+=String.fromCharCode(code.charCodeAt(i)+code.charCodeAt(i-1));  
			}  
			return c; 
		}  
		
		public static function getKey(code:String ):Number   
		{  
			code=unescape(code);  
			var c:String =String.fromCharCode(code.charCodeAt(0)-code.length);  
			for(var i:int=1;i<code.length;i++){  
				c+=String.fromCharCode(code.charCodeAt(i)-c.charCodeAt(i-1));  
			}  
			return Number(c);  
		} 
		public static function getExp(code:String):Array  
		{  
			var getArr:Array=[];
			var getExpDataA:String=code.split('|').join('","');
			var getExpDataB:String=getExpDataA.split('*').join('"],["');
			var getExpData:String='[["'+getExpDataB+'"]]';
			var getObj:Object=JSON.parse(getExpData);
			getArr=getObj as Array;
			var getData:Array=[];
			for(var i:int=0;i<getArr.length;i++){
				var eId:Number=Number(getKey(getArr[i][0]));
				var data:Number=Number(getKey(getArr[i][1]));				
				for(var y:int=0;y<getArr.length;y++){
					if(eId==y){
						getData[y]=data;
					}
				}	
			}
			return getData;  
		} 
		public static function setInt(index:int):String {
			var getNum:Array=["sx$rdqkh","!bpowms(","w^vl10i!","8p46*k1w","s3n2%#bd","cp1$wgnl","^f%(*lp6","0vnke%^g","xury20(k","velfozmu"];
			var infoInt:String=String(index);
			var getStr:String="";
			for(var i:int=0;i<infoInt.length;i++){
				getStr=getStr+String(getNum[infoInt[i]]);
			}
			
			return getStr;
		}
		public static function getInt(str:String):Number {
			var getNum:String="";
			var getStrMax:int=str.length/8;
			for(var i:int=0;i<getStrMax;i++){
				var get_Md5:Number=getMd5(str.substring(0,8));
				str=str.substring(8);
				if(get_Md5==-1){
					return-1;
				}else{
					getNum=getNum+String(get_Md5);
				}
			}
			var getStr:Number=Number(getNum);
			return getStr;
		}
		private static function getMd5(str:String):Number {
			var getArr:Array=["sx$rdqkh","!bpowms(","w^vl10i!","8p46*k1w","s3n2%#bd","cp1$wgnl","^f%(*lp6","0vnke%^g","xury20(k","velfozmu"];
			
			var getNum:int=-1;
			
			for(var i:int=0;i<getArr.length;i++){
				if(getArr[i]==str){
					return i;
				}
			}
			return getNum;
		}
	}
}