package fount.core;

using fount.Core;

class Int64Tools {
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

    public static inline function hash(i: Int64, hasher: Hasher): Void {
        hasher.i64(i);
    }

    public static inline function toStr(i: Int64): String {
        return '$i';
    }

    public static inline function toRepr(i: Int64): String {
        return '${i}i64';
    }

    public static function toHexStr(i: Int64): String {
        final buf = new StringBuf();
        while (!Int64.isZero(i)) {
            buf.addChar(HEXSYM_LUT[i.low & 0xf]);
            i >>>= 4;
        }
        while (buf.length < 16) buf.addChar("0".code);
        return buf.toString().reverse();
    }

    public static inline function toHexRepr(i: Int64): String {
        return '0x${i.toHexStr()}';
    }

    public static inline function rol(i: Int64, b: Int): Int64 {
        final b = b & 63;
        return (i << b) | (i >>> (64 - b));
    }

    public static inline function ror(i: Int64, b: Int): Int64 {
        final b = b & 63;
        return (i >>> b) | (i << (64 - b));
    }
}
