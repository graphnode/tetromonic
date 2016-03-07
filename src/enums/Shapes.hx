package enums;

import utilities.*;

class Shapes 
{
    public static var Z : Array2d<Int> = new Array2d<Int>(3, 3, [
        1, 1, 0,
        0, 1, 1,
        0, 0, 0
    ]);

    public static var S : Array2d<Int> = new Array2d<Int>(3, 3, [
        0, 1, 1,
        1, 1, 0,
        0, 0, 0
    ]);

    public static var T : Array2d<Int> = new Array2d<Int>(3, 3, [
        0, 1, 0,
        1, 1, 1,
        0, 0, 0
    ]);

    public static var O : Array2d<Int> = new Array2d<Int>(2, 2, [
        1, 1,
        1, 1
    ]);

    public static var I : Array2d<Int> = new Array2d<Int>(4, 4, [
        0, 0, 0, 0,
        1, 1, 1, 1,
        0, 0, 0, 0,
        0, 0, 0, 0
    ]);

    public static var J : Array2d<Int> = new Array2d<Int>(3, 3, [
        1, 0, 0,
        1, 1, 1,
        0, 0, 0
    ]);

    public static var L : Array2d<Int> = new Array2d<Int>(3, 3, [
        0, 0, 1,
        1, 1, 1,
        0, 0, 0
    ]);
}
