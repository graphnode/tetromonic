package entities;

import luxe.*;
import luxe.Entity;
import luxe.Text;

class Debug extends Entity
{
	var lbDelta : Text;
	var lbDC : Text;

	override function new()
	{
		super({});
	}

	override function init()
	{
		super.init();

		var text_size = 10;

		lbDelta = new Text({
			pos : new Vector(0, 0),
			point_size : text_size, //pt
			depth : 3,
			align : TextAlign.left,
			text : 'deltatime: ?',
			color : new Color(255,255,255)
		});

		lbDC = new Text({
			pos : new Vector(0, text_size),
			point_size : text_size, //pt
			depth : 3,
			align : TextAlign.left,
			text : 'drawcalls: ?',
			color : new Color(255,255,255)
		});
	}

	override function update(dt:Float)
	{
		if (lbDelta != null && lbDC != null)
		{
			lbDelta.text = 'deltatime: '+ Std.string(dt).substr(0, 6);
			lbDC.text = 'drawcalls: '+ Luxe.renderer.batcher.draw_calls;
		}
	}
}
