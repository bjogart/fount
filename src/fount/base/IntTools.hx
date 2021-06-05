package fount.base;

import haxe.Int32;

using fount.Core;

class IntTools {
    public static inline final MIN: Int32 = 0x80000000;
    public static inline final MAX: Int32 = 0x7fffffff;
    static final HEXSYM_LUT: Array<Int> = [
        "0".code,
        "1".code,
        "2".code,
        "3".code,
        "4".code,
        "5".code,
        "6".code,
        "7".code,
        "8".code,
        "9".code,
        "a".code,
        "b".code,
        "c".code,
        "d".code,
        "e".code,
        "f".code
    ];

    public static inline function eq(i1: Int, i2: Int): Bool {
        return i1 == i2;
    }

    public static inline function ne(i1: Int, i2: Int): Bool {
        return i1 != i2;
    }

    public static inline function cmp(i1: Int, i2: Int): Int {
        return i1 - i2;
    }

    public static inline function lt(i1: Int, i2: Int): Bool {
        return i1 < i2;
    }

    public static inline function le(i1: Int, i2: Int): Bool {
        return i1 <= i2;
    }

    public static inline function gt(i1: Int, i2: Int): Bool {
        return i1 > i2;
    }

    public static inline function ge(i1: Int, i2: Int): Bool {
        return i1 >= i2;
    }

    public static inline function isEven(i: Int): Bool {
        return i & 1 == 0;
    }

    public static inline function isOdd(i: Int): Bool {
        return i & 1 == 1;
    }

    public static inline function min(i1: Int, i2: Int): Int {
        return i1 <= i2 ? i1 : i2;
    }

    public static inline function max(i1: Int, i2: Int): Int {
        return i1 >= i2 ? i1 : i2;
    }

    public static inline function abs(i: Int): Int {
        return i < 0 ? -i : i;
    }

    public static inline function toStr(i: Int): String {
        return '$i';
    }

    public static inline function toRepr(i: Int): String {
        return '${i}i';
    }

    public static function toHexStr(i: Int): String {
        final buf = new StringBuf();
        while (i > 0) {
            buf.addChar(HEXSYM_LUT[i & 0xf]);
            i >>>= 4;
        }
        while (buf.length < 1) buf.addChar("0".code);
        return buf.toString().reverse();
    }

    public static function toHexRepr(i: Int): String {
        return '0x${i.toHexStr()}';
    }

    public static inline function sign(i: Int): Int {
        return if (i > 0) {
            1;
        } else if (i < 0) {
            -1;
        } else {
            0;
        }
    }

    public static inline function asFloat(i: Int): Float {
        return i;
    }

    public static inline function asInt32(i: Int): Int32 {
        return i;
    }

    public static inline function hash(i: Int, hasher: Hasher): Void {
        hasher.addInt32(i);
    }
}
