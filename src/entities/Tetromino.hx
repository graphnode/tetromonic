package entities;

import luxe.*;
import luxe.Entity;
import phoenix.Texture;

import components.*;
import enums.*;
import utilities.*;

class Tetromino extends Entity
{
	public var playfield(default, null) : Playfield;
	public var tiles(default, null) : Array2d<Int>;
    public var color(default, null) : Int;

    public function new(playfield : Playfield, tiles: Array2d<Int>, color: Int)
	{
        super({
            //parent: playfield
        });

		this.playfield = playfield;
        this.tiles = tiles;
        this.color = color;
    }
	
	override function init() 
	{
		super.init();

		this.add(new Controllable());
		this.add(new Falling());
		
        var blocks_texture = Luxe.resources.texture('assets/blocks.png');
		var tile_size = new Vector(20, 20);
        var uv = new Rectangle(this.color * 20, 0, 20, 20);
		
        for (x in 0...this.tiles.width)
            for (y in 0...this.tiles.height)
				if (this.tiles.get(x, y) == 1)
                {
					new Sprite({
                        pos: new Vector(x * 20, y * 20),
                        size: tile_size,
                        texture: blocks_texture,
                        uv: uv,
                        parent: this,
                        depth: 1,
                        centered: false
                    });
				}
    }

    public function move(direction : Direction) : Bool
	{
		var x = Math.floor(this.pos.x / 20);
		var y = Math.floor(this.pos.y / 20);
		
        switch(direction)
		{
			case Up:
				if (!this.playfield.checkCollision(x, y - 1, tiles))
				{
					this.pos.y -= 20;
					return true;
				}
			case Right:
                if (!this.playfield.checkCollision(x + 1, y, tiles))
				{
					this.pos.x += 20;
					return true;
				}
			case Down:
                if (!this.playfield.checkCollision(x, y + 1, tiles))
				{
					this.pos.y += 20;
					return true;
				}
            case Left:
                if (!this.playfield.checkCollision(x - 1, y, tiles))
				{
					this.pos.x -= 20;
					return true;
				}
        }
		
		return false;
    }

    public function rotate(direction : Direction) : Bool
	{
		var newTiles : Array2d<Int>;
		
		switch(direction) {
			case Left:
				newTiles = this.tiles.rotateCounterclockwise();
			case Right:
				newTiles = this.tiles.rotateClockwise();
			default:
				return false;
		}

		var x = Math.floor(this.pos.x / 20);
		var y = Math.floor(this.pos.y / 20);

		if (this.playfield.checkCollision(x, y, newTiles))
		{
			if (!this.playfield.checkCollision(x - 1, y, newTiles))
			{
				this.pos.x -= 20;
			} 
			else if (!this.playfield.checkCollision(x + 1, y, newTiles)) 
			{
				this.pos.x += 20;
			} 
			else if (!this.playfield.checkCollision(x, y - 1, newTiles)) 
			{
				this.pos.y -= 20;
			} 
			else 
			{
				return false;
			}
		}

        var childCount = 0;
        for (x in 0...this.tiles.width)
            for (y in 0...this.tiles.height)
                if (newTiles.get(x, y) == 1) {
                    this.children[childCount].pos = new Vector(x * 20, y * 20);
                    childCount++;
                }
		
		this.tiles = newTiles;
		return true;
    }
}
