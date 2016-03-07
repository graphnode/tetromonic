import Luxe;
import luxe.Input;
import luxe.Text;
import luxe.*;

import entities.*;
import enums.*;

class Main extends luxe.Game
{
	override function ready()
	{
		var parcel = new Parcel({
			textures : [
				{ id: 'assets/playfield.png' },
				{ id: 'assets/blocks.png' }
			],
		});

		new ParcelProgress({
			parcel      : parcel,
			background  : new Color(1,1,1,0.32),
			oncomplete  : assets_loaded
		});

		parcel.load();
	}

	function assets_loaded(_)
	{
		new Debug();

		var playfield = new Playfield();
	}
}
