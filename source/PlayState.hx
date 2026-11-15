package;

import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();

		var button1 = new Button('CLI Project');
		var button2 = new Button('Haxe Project');
		var button3 = new Button('HaxeFlixel Project');

		for (button in [button1, button2, button3])
		{
			button.screenCenter();
			add(button);
		}

		button1.x -= button1.width * 1.1;
		button3.x += button3.width * 1.1;
	}
}
