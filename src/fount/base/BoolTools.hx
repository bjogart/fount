package fount.base;

using fount.Core;

class BoolTools {
    public static inline function toInt(b: Bool): Int {
        return b ? 1 : 0;
    }

    public static inline function eq(b1: Bool, b2: Bool): Bool {
        return b1 == b2;
    }

    public static inline function ne(b1: Bool, b2: Bool): Bool {
        return b1 != b2;
    }

    public static inline function cmp(b1: Bool, b2: Bool): Int {
        return if (b1) {
            1 - b2.toInt();
        } else {
            b2.toInt();
        }
    }

    public static inline function lt(b1: Bool, b2: Bool): Bool {
        return !b1 && b2;
    }

    public static inline function le(b1: Bool, b2: Bool): Bool {
        return !b1;
    }

    public static inline function gt(b1: Bool, b2: Bool): Bool {
        return b1 && !b2;
    }

    public static inline function ge(b1: Bool, b2: Bool): Bool {
        return b1;
    }
}
