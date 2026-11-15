import flixel.FlxG;
import flixel.util.FlxColor;

class Button extends flixel.FlxSprite
{
	var onClick:Void->Void;

	override public function new(?onClick:Void->Void)
	{
		super();

		makeGraphic(1, 1);
		setGraphicSize(128, 128);
		color = FlxColor.GRAY;

		this.onClick = onClick;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.overlaps(this))
		{
			if (FlxG.mouse.justPressed && onClick != null)
			{
				onClick();
			}
		}
	}
}
