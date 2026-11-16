import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxColor;

class Button extends flixel.FlxSprite
{
	var onClick:Void->Void;

	var textfield:FlxText;

	override public function new(text:String, dimensions:FlxPoint, ?onClick:Void->Void)
	{
		super();

		makeGraphic(1, 1);
		setGraphicSize(dimensions.x, dimensions.y);
		color = FlxColor.GRAY;

		this.onClick = onClick;

		updateHitbox();
		textfield = new FlxText(0, 0, width, text, 16);
		textfield.alignment = CENTER;
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

	override function draw()
	{
		super.draw();

		if (textfield == null)
			return;

		textfield.cameras = this.cameras;
		textfield.setPosition(this.x + (textfield.width / 2) - (textfield.width / 2), this.y + (this.height / 2) - (textfield.height / 2));
		textfield.draw();
	}
}
