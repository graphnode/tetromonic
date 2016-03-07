package components;

import Luxe;
import luxe.Input;
import luxe.Text;
import luxe.*;

import entities.*;
import enums.*;

class Controllable extends Component
{
	override public function init()
	{
		Luxe.input.bind_key('left', Key.left);
		Luxe.input.bind_key('left', Key.key_a);

		Luxe.input.bind_key('right', Key.right);
		Luxe.input.bind_key('right', Key.key_d);

		Luxe.input.bind_key('rotate_right', Key.key_w);
		Luxe.input.bind_key('rotate_right', Key.up);
		Luxe.input.bind_key('rotate_right', Key.key_x);
		Luxe.input.bind_key('rotate_left', Key.key_z);

		Luxe.input.bind_key('soft_drop', Key.down);
		Luxe.input.bind_key('soft_drop', Key.key_s);
		Luxe.input.bind_key('hard_drop', Key.space);
	}

	override public function update(dt:Float)
	{
		var block = cast(entity, Tetromino);

		if (Luxe.input.inputpressed('left'))
		{
			block.move(Direction.Left);
		}
		else if (Luxe.input.inputpressed('right'))
		{
			block.move(Direction.Right);
		}
		else if (Luxe.input.inputpressed('rotate_left'))
		{
			block.rotate(Direction.Left);
		}
		else if (Luxe.input.inputpressed('rotate_right'))
		{
			block.rotate(Direction.Right);
		}
	}
}