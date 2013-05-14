package screens
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author 
	 */
	public class GameScreen extends Sprite
	{
		
		private var rows:int = 8;
		private var columns:int = 8;
		private var cells:Array = [];
		
		private var cellHolder:Sprite = new Sprite();
		public function GameScreen()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			for (var i:int = 0; i < rows; i++) // x
			{
				for (var j:int = 0; j < columns; j++) // y
				{
					// at a glance this is scary, but all it does is check what type of tile (color for floor) the tile should be.
					// it does this by checking if x and y are both even/odd, i.e.
					// (3,1) is a '0' tile, so is (2,2)
					// but (3,2) and (2,5) are '1' tiles, because they are both the same 
					var tempTile:Tile = new Tile((i % 2 == j % 2) ? 0 : 1);					
					setCell(i, j, tempTile);
					cellHolder.addChild(tempTile);
					
					// Originally I had the idea to have cellX and cellY variables, but the positioning uses both variables
					// so if you set them like normal, it would screw up positioning
					tempTile.setPos(i, j); 
				}
			}
			
			addChild(cellHolder);
			cellHolder.x = Main.STAGE_HALF_WIDTH;
			cellHolder.y = Main.STAGE_HALF_HEIGHT - cellHolder.height / 2;
		}
		
		/**
		 * Takes a coordinate in relation to the stage (global) and finds the cell x/y that it would be pointing to.
		 * @param	x	X coordinate in relation to the stage.
		 * @param	y	Y coordinate in relation to the stage.
		 * @return
		 */
		private function snapToCell(x:Number, y:Number):Point 
		{
			var screenX:Number = x - cellHolder.x;
			var screenY:Number = y - cellHolder.y;
			var xPos:int = (screenY / Main.TILE_HALF_HEIGHT + screenX / Main.TILE_HALF_WIDTH) / 2;
			var yPos:int = (screenY / Main.TILE_HALF_HEIGHT - screenX / Main.TILE_HALF_WIDTH) / 2;
			
			return new Point(xPos, yPos);
		}
		
		/**
		 * Sets the data portion of a cell at the position specified. Rendering/adding is not 
		 * delegated by this function, so remember to still addChild() your cell if needed.
		 * @param	x	Cell at x coordinate
		 * @param	y	Cell at y coordinate
		 * @param	tile	Tile to place in the array.
		 */
		private function setCell(x:int, y:int, tile:Tile):void
		{
			if (x < rows && y < columns)
			{
				cells[y * columns + x] = tile;
			}
			else
			{
				throw(new Error("Cannot place a cell at (" + x + ", " + y + "). Outside of bounds."));
			}
		}
		
		/**
		 * Returns the cell at the location (x, y) in cells.
		 * @param	x	
		 * @param	y
		 * @return
		 */
		private function getCell(x:int, y:int):Tile
		{
			// if is not out of bounds, return tile, else return null
			return (x < rows && y < columns) ? cells[y * columns + x] : null;
		}
	}
}