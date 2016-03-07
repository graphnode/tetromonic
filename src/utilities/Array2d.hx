package utilities;

class Array2d<T>
{
	public var width(default, null): Int; 
	public var height(default, null): Int;
	
	private var values : Array<T>;
		
    public function new(width: Int, height: Int, ?values : Array<T>) 
    { 
        this.width = width;
		this.height = height;
		this.values = new Array<T>();
		
		if (values != null) 
		{
			for (i in 0...(width * height))
				if (i < values.length)
					this.values[i] = values[i]; 
		}
    }

    public function get(x: Int, y: Int) : T
    { 
        return this.values[y * width + x]; 
    }
	
	public function set(x: Int, y: Int, value : T) 
    { 
        this.values[y * width + x] = value; 
    }
	
	public function rotateClockwise() : Array2d<T>
	{
		var ret = new Array2d(this.height, this.width);
		
		for (x in 0...this.width)
			for (y in 0...this.height)
				ret.set(x, y, this.get(y, height - x - 1));

		return ret;
	}
	
	public function rotateCounterclockwise() : Array2d<T>
	{
		var ret = new Array2d(this.height, this.width);
		
		for (x in 0...this.width)
			for (y in 0...this.height)
				ret.set(x, y, this.get(width - y - 1, x));
		
		return ret;
	}
	
	public function insertArrayAt(x : Int, y : Int, source : Array2d<T>)
	{
		for (i in 0...source.width)
			for (j in 0...source.height)
				if (x + i < this.width && y + j < this.height)
					this.set(x + i, y + j, source.get(i, j));
	}
}