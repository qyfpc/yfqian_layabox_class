package yfqian.yfqian_name
{
	

	public class yfqian_RandomName extends yfqian_NameList
	{
		public static var textWz:String;
		public  static function get MyName():String{
			var NameAnum:int = Math.round( Math.random() * ( 1037 - 1 ) + 1 );
			var NameBnum:int = Math.round( Math.random() * ( 6960 - 1 ) + 1 );
			var NameCnum:int = Math.round( Math.random() * ( 211 - 1 ) + 1 );
			var NameDnum:int = Math.round( Math.random() * ( 1037 - 1 ) + 1 );
			var NameEnum:int = Math.round( Math.random() * ( 6960 - 1 ) + 1 );
			var GaiLv:int = Math.round( Math.random() * ( 10 - 1 ) + 1 );
			if ( GaiLv == 1 )
			{
				textWz = NameA[NameAnum] + NameB[NameBnum] + NameC[NameCnum];
			}else if(GaiLv == 2)
			{
				textWz = NameA[NameAnum] + NameB[NameBnum]+ NameA[NameDnum];
			}else
			{
				textWz = NameA[NameAnum] + NameB[NameBnum];
			}
			return textWz;
			trace(textWz)
		}
		
	}
}