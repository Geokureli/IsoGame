package 
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import screens.*;
	
	/**
	 * Date Started: 5/12/2013
	 * @author Noah 'RTLShadow' Bond
	 * 
	 * DISREGARD THIS IF YOU SEE NO README!
	 * Please read the readme.txt before sending a pull request.
	 * It goes over proper etiquette and the standard of code
	 * in this project. Thanks!
	 */
	public class Main extends Sprite 
	{
		public static var STAGE_WIDTH:int = 800;
		public static var STAGE_HEIGHT:int = 600;		
		public static var STAGE_HALF_WIDTH:int = 400;
		public static var STAGE_HALF_HEIGHT:int = 300;
		
		public static var TILE_WIDTH:int = 44;
		public static var TILE_HEIGHT:int = 22;
		public static var TILE_HALF_WIDTH:int = 22;
		public static var TILE_HALF_HEIGHT:int = 11;
		
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			ScreenManager.init(this);
			ScreenManager.addScreen("GameScreen", new GameScreen());
			ScreenManager.switchScreen("GameScreen");
		}
	}
}
//i can keyboard