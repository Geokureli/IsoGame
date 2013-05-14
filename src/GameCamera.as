package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import input.KeyboardHandler;
	
	/**
	 * Handles the camera management for the game.
	 * Allows centering the screen at a specific point in the game world.
	 * 
	 * This class is named GameCamera to avoid ambiguity with flash.media.Camera.
	 * 
	 * @author Kevan 'Kaveman' Robinson
	 */
	public class GameCamera extends Sprite
	{
		/**
		 * Gets or sets the world x co-ordinate of the center of the camera.
		 */
		public function get focusX():Number { return -x + stage.stageWidth / 2; }
		public function set focusX(val:Number):void { x = (-val) + stage.stageWidth / 2; }
		
		/**
		 * Gets or sets the world y co-ordinate of the center of the camera.
		 */
		public function get focusY():Number { return -y + stage.stageHeight / 2; }
		public function set focusY(val:Number):void { y = ( -val) + stage.stageHeight / 2; }
		
		public function GameCamera() 
		{
			// TODO: Currently used for creating debugging function.
			//       Remove or modify when done.
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		// TODO: Currently used for creating debugging function.
		//       Remove or modify when done.
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(Event.ENTER_FRAME, testUpdate);
		}
		
		// TODO: Debugging function. Remove when done.
		private function testUpdate(e:Event):void 
		{
			// Move the camera around with the WASD keys.
			var ins:KeyboardHandler = KeyboardHandler.instance;
			
			if (ins.isKeyDown(Keyboard.D))
				focusX += 5;
			else if (ins.isKeyDown(Keyboard.A))
				focusX -= 5;
				
			if (ins.isKeyDown(Keyboard.S))
				focusY += 5;
			else if (ins.isKeyDown(Keyboard.W))
				focusY -= 5;
			
			// Draws a crosshair in the center of the screen.
			graphics.clear();
			graphics.lineStyle(1,0xA00000);
			graphics.drawCircle(focusX, focusY, 10);
			graphics.moveTo(focusX - 10, focusY);
			graphics.lineTo(focusX + 10, focusY);
			graphics.moveTo(focusX, focusY - 10);
			graphics.lineTo(focusX, focusY + 10);
		}
		
	}

}