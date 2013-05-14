package 
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author 
	 */
	public class Tile extends Sprite
	{
		public var cellArt:MovieClip;
		
		public var id:int = 0;
		private var _cellX:int;
		private var _cellY:int;
		
		public function Tile(_id:int)
		{
			id = _id;
			
			cellArt = new TileDirectory.tiles[id]();
			addChild(cellArt);
		}
		
		/**
		 * Sets the position of the cell. 
		 * @param	cx
		 * @param	cy
		 */
		public function setPos(cx:int, cy:int):void
		{
			_cellX = cx;
			_cellY = cy;
			x = (cx - cy) * Main.TILE_HALF_WIDTH;
			y = (cx + cy) * Main.TILE_HALF_HEIGHT;
		}
		
		public function get cellX():int { return _cellX }
		public function get cellY():int { return _cellY }
	}
}