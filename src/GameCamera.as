package  
{	
	/**
	 * Handles the camera management for the game.
	 * Allows centering the screen at a specific point in the game world.
	 * 
	 * This class is named GameCamera to avoid ambiguity with flash.media.Camera.
	 *
	 * @author Kevan 'Kaveman' Robinson
	 */
	public class GameCamera
	{
		/**
		 * Gets the center x of the world camera.
		 */
		public static function get focusX():Number { return x + Main.STAGE_HALF_WIDTH; }
		
		/**
		 * Sets the center x of the world camera.
		 */
		public static function set focusX(val:Number):void { x = val - Main.STAGE_HALF_WIDTH; }
		
		
		/**
		 * Gets the center y of the world camera.
		 */
		public static function get focusY():Number { return y + Main.STAGE_HALF_HEIGHT; }
		
		/**
		 * Sets the center y of the world camera.
		 */
		public static function set focusY(val:Number):void { y = val - Main.STAGE_HALF_HEIGHT; }

		public function GameCamera() 
		{
			throw new Error("GameCamera is a singleton, do not instaniate it.");
		}
	}
}
