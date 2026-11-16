import flixel.util.FlxColorTransformUtil;
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

		interactionCheck();
	}

	function interactionCheck()
	{
		var targetMult = (FlxG.mouse.overlaps(this)) ? ((onClick == null) ? 0.5 : 1.5) : 1;

		this.colorTransform = FlxColorTransformUtil.setMultipliers(this.colorTransform, targetMult, targetMult, targetMult);

		if (!FlxG.mouse.overlaps(this))
			return;
		if (!FlxG.mouse.justPressed)
			return;
		if (onClick == null)
			return;

		onClick();
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
