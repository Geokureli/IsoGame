package input 
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * Designed to provide more specific access to the mouse compared to
	 * having the code duplicated accross multiple objects.
	 * 
	 * @author Kevan 'Kaveman' Robinson
	 */
	public class MouseHandler 
	{		
		private static var _stage:Stage;
				
		private static var _mouseDown:Boolean;
		private static var _mouseDownLast:Boolean;
		private static var _mouseX:int;
		private static var _mouseY:int;
		
		/**
		 * Setup for the MouseHandler
		 * @param	stage A reference to the current stage.
		 */
		public static function start(s:Stage):void
		{
			_stage = s;
			_stage.addEventListener(MouseEvent.MOUSE_DOWN, onLeftMouseDown, false, 1);
			_stage.addEventListener(MouseEvent.MOUSE_UP, onLeftMouseUp, false, 1);
			_stage.addEventListener(Event.ENTER_FRAME, update, false, -1);
			
			_mouseDown = false;
			_mouseDownLast = false;
			_mouseX = 0;
			_mouseY = 0;
		}
		
		/**
		 * Gets the mouse position as a point.
		 */
		public static function get mousePosition():Point 
		{ 
			return new Point(_mouseX, _mouseY); 
		}
		
		/**
		 * Gets the screen x-coordinate of the mouse cursor.
		 */
		public static function get mouseX():int 
		{ 
			return _mouseX;
		}
		
		/**
		 * Gets the screen x-coordinate of the mouse cursor.
		 */
		public static function get mouseY():int 
		{
			return _mouseY;
		}
		
		/**
		 * Gets whether the left mouse button is depressed.
		 */
		public static function get isLeftMouseDown():Boolean 
		{
			return _mouseDown;
		}
		
		/**
		 * Gets whether the left mouse button was just clicked this frame.
		 */
		public static function get isLeftMouseClicked():Boolean 
		{
			return _mouseDown && !_mouseDownLast;
		}
		
		/**
		 * Called when the left mouse button is depressed.
		 */
		private function onLeftMouseDown(e:MouseEvent):void 
		{
			_mouseDown = true;
		}
		
		/**
		 * Called when the left mouse button is released.
		 */
		private function onLeftMouseUp(e:MouseEvent):void 
		{
			_mouseDown = false;
		}
		
		/**
		 * Updates the MouseHandler instance every frame.
		 */
		private function update(e:Event):void 
		{
			_mouseDownLast = _mouseDown;
			_mouseX = _stage.mouseX;
			_mouseY = _stage.mouseY;
		}
		
		// Don't instantiate
		public function MouseHandler()
		{
			throw new Error("Don't instantiate MouseHandler()!");
		}
	}
}
