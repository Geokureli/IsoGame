package 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
	 * Handles rendering and organization of screens.
	 * @author Noah 'RTLShadow' Bond
	 */
	public class ScreenManager 
	{
		static public  var _screenContainer:Sprite;
		static private var _currentScreen:Sprite;
		static private var screens:Array;
		static private var screenNames:Array;
		
		/**
		 * Initializes ScreenManager, call this for rendering screens.
		 * @param	screenContainer	This Sprite is where everything in the 'currentScreen' is rendered. Recommended is stage or a reference to Main.	
		 */
		public static function init(screenContainer:Sprite):void
		{
			_screenContainer = screenContainer;
			_currentScreen = null;
			
			screens = [];
			screenNames = [];
		}
		
		/**
		 * Adds a screen to the render possibilities.
		 * @param	name		Name to associate the screen with when rendering/removing/etc.
		 * @param	screen	Reference to the screen to use.
		 * @return	0 = no problems, 1 = screen already added
		 */
		public static function addScreen(name:String, screen:Sprite):int
		{
			var screenPos:int;
			if (screenNames.indexOf(name) == -1)
			{
				screenNames.push(name);
			}
			screenPos = screenNames.indexOf(name);
			
			if (screens[screenPos] == null)
			{
				screens[screenPos] = screen;
			}
			else
			{
				trace("WARNING: Already added screen named '" + name + "'. Please use a nonexistant name.");
				return 1;
			}
			return 0;
		}
		
		/**
		 * Removes the current screen, and then assigns and adds the new one to the container.
		 * @param	name
		 */
		public static function switchScreen(name:String):void
		{
			if (currentScreen != null)
			{
				_screenContainer.removeChild(currentScreen);
			}
			
			_currentScreen = screens[screenNames.indexOf(name)];
			_screenContainer.addChild(currentScreen);
		}
		
		/**
		 * Get the current screen in the container.
		 */
		public static function get currentScreen():Sprite
		{
			return _currentScreen;
		}
	}
}