package input 
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * Designed to provide more specific access to the keyboard compared to
	 * having the code duplicated accross multiple objects.
	 * 
	 * Call MouseHandler.start(stage) in the main class, after which
	 * other classes can access a reference to the handler instance with MouseHandler.instance.
	 * 
	 * @author Kevan 'Kaveman' Robinson
	 */
	public class MouseHandler 
	{
		private static var _instance:MouseHandler;
		
		/**
		 * Gets the current of instance the MouseHandler
		 */
		public static function get instance():MouseHandler
		{ 
			if (!_instance)
				throw new Error("Instance of MouseHandler does not exist. Call MouseHandler.start before attempting to access this instance.");
			return _instance;
		}
		
		/**
		 * Starts the mouse handler instance. This function must be called before attempting to access the instance.
		 * @param	stage A reference to the current stage.
		 */
		public static function start(s:Stage):void
		{
			_instance = new MouseHandler(new Lockout(), s);
		}
		
		private var _mouseDown:Boolean;
		private var _mouseDownLast:Boolean;
		private var _mouseX:int;
		private var _mouseY:int;
		
		/**
		 * Gets the mouse position as a point.
		 */
		public function get mousePosition():Point 
		{ 
			return new Point(_mouseX, _mouseY); 
		}
		
		/**
		 * Gets the screen x-coordinate of the mouse cursor.
		 */
		public function get mouseX():int 
		{ 
			return _mouseX;
		}
		
		/**
		 * Gets the screen x-coordinate of the mouse cursor.
		 */
		public function get mouseY():int 
		{
			return _mouseY;
		}
		
		/**
		 * Gets whether the left mouse button is depressed.
		 */
		public function get isLeftMouseDown():Boolean 
		{
			return _mouseDown;
		}
		
		/**
		 * Gets whether the left mouse button was just clicked this frame.
		 */
		public function get isLeftMouseClicked():Boolean 
		{
			return _mouseDown && !_mouseDownLast;
		}
		
		/**
		 * A restricted constructor for the MouseHandler class.
		 * @param	lockout A class designed to ensure other objects cannot instantiate this class.
		 * @param	stage A refernce to the stage.
		 */
		public function MouseHandler(lockout:Lockout, stage:Stage) 
		{
			if (!lockout) { throw new Error("Do not to attempt to instanitate this class. Call MouseHandler.start instead."); }
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onLeftMouseDown, false, 1);
			stage.addEventListener(  MouseEvent.MOUSE_UP,     onLeftMouseUp, false, 1);
			stage.addEventListener(    Event.ENTER_FRAME,      update, false,-1);
			
			_mouseDown = false;
			_mouseDownLast = false;
			_mouseX = 0;
			_mouseY = 0;
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
		
	}

}

// Designed to enforce singleton pattern
class Lockout {}