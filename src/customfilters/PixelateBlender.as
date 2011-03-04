package customfilters
{
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	import flash.utils.ByteArray;

	public class PixelateBlender extends ShaderFilter
	{
		//the file that contains the binary bytes of the PixelBender filter
		[Embed("pixelate.pbj", mimeType="application/octet-stream")]
		private var Filter:Class;		

		private var _shader:Shader;

		public function PixelateBlender(value:Number = 50)
		{
			//initialize the ShaderFilter with the PixelBender filter we
			//embedded
			_shader = new Shader(new Filter() as ByteArray);

			//set the default value
			this.value = value;
			super(_shader);
		}

		//This filter only has one value, named value
		public function get value():Number
		{
			return _shader.data.dimension.value[0];
		}

		public function set value(value:Number):void
		{
			//not that pixel bender filters take an array of values, even
			//though we only have one in our example
			_shader.data.dimension.value = [value];
		}		

	}
}
