package;

import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		final bigWidth = FlxPoint.get(128, 128);
		final smallWidth = FlxPoint.get(256, 32);

		var button1 = new Button('CLI Project', bigWidth);
		var button2 = new Button('Haxe Project', bigWidth);
		var button3 = new Button('HaxeFlixel Project', bigWidth);
		var button4 = new Button('Edit CProjectMaker', smallWidth);

		for (button in [button1, button2, button3,button4])
		{
			button.screenCenter();
			add(button);
		}

		button1.x -= button1.width * 1.1;
		button3.x += button3.width * 1.1;

		button4.x = 16;
		button4.y = FlxG.height - button4.height - 16;
	}
}
