package entities;

import luxe.*;
import luxe.Entity;
import phoenix.Texture;

import entities.*;
import enums.*;
import utilities.*;

class Playfield extends Entity
{
	private var landedTiles : Array2d<Int> = null;

	override function new()
	{
		super({
			pos: new Vector(0, 0)
		});
	}

	override function init()
	{
		super.init();

		var playfield_texture = Luxe.resources.texture('assets/playfield.png');

		new Sprite({
			pos: new Vector(0, 0),
			size: Luxe.screen.size,
			texture: playfield_texture,
			uv: Luxe.screen.bounds,
			depth: 0,
			centered: false
		});

		landedTiles = new Array2d<Int>(10, 16, [for (i in 0...160) 0]);

		Luxe.events.listen('tetromino:stuck', onTetrominoStuck);

		new Tetromino(this, Shapes.J, Colors.Green);
	}

	public function checkCollision(blockX : Int, blockY : Int, blockTiles : Array2d<Int>) : Bool
	{
		for (x in 0...blockTiles.width)
		{
			for (y in 0...blockTiles.height)
			{
				if (blockTiles.get(x, y) == 0)
					continue;

				if (x + blockX < 0 || y + blockY < 0)
					return true;

				if (x + blockX >= landedTiles.width || y + blockY >= landedTiles.height)
					return true;

				if (landedTiles.get(x + blockX, y + blockY) != 0)
					return true;
			}
		}

		return false;
	}

	public function onTetrominoStuck(props)
	{
		trace('onTetrmoninoStuck');

		var tetromino = cast(props.tetromino, Tetromino);

		//var x = Math.floor(tetromino.pos.x / 20);
		//var y = Math.floor(tetromino.pos.y / 20);
		//var tiles = tetromino.tiles;

		tetromino.destroy();

		//landedTiles.insertArrayAt(x, y, tiles);

		new Tetromino(this, Shapes.Z, Colors.Red);
	}
}
