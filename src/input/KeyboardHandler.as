package input 
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * Designed to provide more specific access to the keyboard compared to
	 * the typical "addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown)."
	 * 
	 * Call KeyboardHandler.start(stage) in the main class, after which
	 * other classes can access a reference to the handler instance with KeyboardHandler.instance.
	 * 
	 * @author Kevan 'Kaveman' Robinson
	 */
	public class KeyboardHandler 
	{
		public static const KEY_COUNT:uint = 256;
		
		private static var _instance:KeyboardHandler;
		private var _keys:Vector.<Boolean>;
		private var _keysLast:Vector.<Boolean>;
		private var _nextCode:int;
		
		/**
		 * Gets the current of instance the KeyboardHandler
		 */
		public static function get instance():KeyboardHandler
		{ 
			if (!_instance)
				throw new Error("Instance of KeyboardHandler does not exist. Call KeyboardHandler.start before attempting to access this instance.");
			return _instance;
		}
		
		/**
		 * Starts the keyboard handler. This function must be called before attempting to access the instance.
		 * @param	stage A reference to the current stage.
		 */
		public static function start(stage:Stage):void
		{
			// Create the instance if it does not exist.
			if (!_instance)
				_instance = new KeyboardHandler(new Lockout(), stage);
		}
		
		/**
		 * A restricted constructor for the KeyboardHandler class.
		 * @param	lockout A class designed to ensure other objects cannot instantiate this class.
		 * @param	stage A refernce to the stage.
		 */
		public function KeyboardHandler(lockout:Lockout, stage:Stage) 
		{
			if (!lockout) { throw new Error("Do not to attempt to instanitate this class. Call KeyboardHandler.start instead."); }
			_keys = new Vector.<Boolean>(KEY_COUNT);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown, false,  1); // Handle keyboard events as soon as possible
			stage.addEventListener(  KeyboardEvent.KEY_UP,   keyUp, false,  1); // Handle keyboard events as soon as possible
			stage.addEventListener(     Event.ENTER_FRAME,  update, false, -1); // Update at the end of frame
		}
		
		/**
		 * Gets whether a keyboard key is depressed.
		 * @param	keyCode The keycode to check.
		 */
		public function isKeyDown(keyCode:int):Boolean
		{
			return _keys[keyCode]; 
		}
		
		/**
		 * Gets whether a keyboard key was just pressed this frame.
		 * @param	keyCode The keycode to check.
		 */
		public function isKeyPressed(keyCode:int):Boolean 
		{ 
			return _keys[keyCode] && !_keysLast[keyCode]; 
		}
		
		/**
		 * Called when a key is pressed or held.
		 */
		private function keyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode < KEY_COUNT)
			{
				_keys[e.keyCode] = true;
				_nextCode = e.charCode;
			}
		}
		
		/**
		 * Called when a key is released.
		 */
		private function keyUp(e:KeyboardEvent):void 
		{
			if (e.keyCode < KEY_COUNT)
				_keys[e.keyCode] = false;
		}
		
		/**
		 * Updates the KeyboardHandler instance every frame.
		 */
		private function update(e:Event):void 
		{
			_keysLast = _keys.concat();
			_nextCode = -1;
		}
		
	}
}

// Designed to enforce singleton pattern
class Lockout {}