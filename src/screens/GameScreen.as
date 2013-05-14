package screens
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 
	 */
	public class GameScreen extends Sprite
	{
		
		private var rows:int = 7;
		private var columns:int = 7;
		public function GameScreen()
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			for (var i:int = Math.floor(-rows / 2); i < Math.floor(rows / 2); i++)
			{
				for (var j:int = Math.floor(-columns / 2); j < Math.floor(columns / 2); j++)
				{
					// at a glance this is scary, but all it does is check what type of tile (color for floor) the tile should be.
					// it does this by checking if x and y are both even/odd, i.e.
					// (3,1) is a '0' tile, so is (2,2)
					// but (3,2) and (2,5) are '1' tiles, because they are both the same 
					var tempTile:Tile = new Tile((Math.abs(i) % 2 == Math.abs(j) % 2) ? 0 : 1);
					
					addChild(tempTile);
					tempTile.setPos(i, j);
				}
			}
		}
	}
}