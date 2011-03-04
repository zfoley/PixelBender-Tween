package 
{
	import com.greensock.easing.Quart;
	import com.greensock.TweenMax;
	import customfilters.PixelateBlender;
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * ...
	 * @author Zach
	 */
	[Frame(factoryClass = "Preloader")]
	
	public class Main extends Sprite 
	{
		[Embed(source = '448px-Science_and_Mechanics_Nov_1931_cover.gif')]
		private var bgArt:Class
		public var filterAmount:Number = 0;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			addChild(new bgArt());
			TweenMax.to(this, 3, { filterAmount:100, yoyo:true, repeat:-1, onUpdate:applyFilter, ease:Quart.easeInOut } );
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}
		
		private function applyFilter():void 
		{
			var pixelate:PixelateBlender = new PixelateBlender();
			pixelate.value = Math.ceil(filterAmount);
			this.filters = [pixelate];
		}

	}

}