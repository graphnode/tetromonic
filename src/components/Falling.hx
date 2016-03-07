package components;

import Luxe;
import luxe.Input;
import luxe.Text;
import luxe.*;

import entities.*;
import enums.*;

class Falling extends Component
{	
	private var timer : Float = 0;
    private var step_interval : Float = 1;
	private var last_step : Float = 0;
	
	override public function update(dt:Float) 
	{
		var tetromino = cast(entity, Tetromino);
		
		timer += dt;

        if (timer >= last_step + step_interval)
		{
            last_step = timer;
            if (!tetromino.move(Direction.Down)) // Collided with something?
			{
				Luxe.events.fire('tetromino:stuck', { tetromino: tetromino });
			}
        }
	}
}