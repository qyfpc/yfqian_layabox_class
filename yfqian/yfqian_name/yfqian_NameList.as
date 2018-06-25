package yfqian.yfqian_name
{
	import yfqian.yfqian_getJosn;

	public class yfqian_NameList
	{
		
		public static var NameA:Object;
		public static var NameB:Object;
		public static var NameC:Object;
		public static var NamePB:Array;
		public function yfqian_NameList():void
		{
			new yfqian_getJosn("assets/data/namea.json",function(dataA):void{
				NameA=dataA;
			});
			
			new yfqian_getJosn("assets/data/nameb.json",function(dataB):void{
				NameB=dataB;
			});
			new yfqian_getJosn("assets/data/namec.json",function(dataC):void{
				NameC=dataC;
			});
			new yfqian_getJosn("assets/data/pingbi.json",function(dataD):void{
				NamePB=dataD;
			});
			
		}
	}
}