package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author 
	 */
	public class Tile extends Sprite
	{
		[Embed(source = "../lib/tile1.png")]
		private var bmpClass1:Class;		
		
		[Embed(source = "../lib/tile2.png")]
		private var bmpClass2:Class;
		private var bmp:Bitmap;
		
		public var id:int = 0;
		private var _cellX:int;
		private var _cellY:int;
		public function Tile(_id:int)
		{
			id = _id;
			
			bmp = (id == 0) ? new bmpClass1() : new bmpClass2();
			addChild(bmp);
			bmp.x = -22;
		}
		
		public function setPos(cx:int, cy:int):void
		{
			_cellX = cx;
			_cellY = cy;
			x = (cx - cy) * Main.TILE_HALF_WIDTH + Main.STAGE_HALF_WIDTH;
			y = (cx + cy) * Main.TILE_HALF_HEIGHT + Main.STAGE_HALF_HEIGHT;
		}
		
		public function get cellX():int { return _cellX }
		public function get cellY():int { return _cellY }
	}
}