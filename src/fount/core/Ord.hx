package fount.core;

typedef Ord<T> = {
    function cmp(o: T): Int;
}

interface IOrd<T> {
    function cmp(o: T): Int;
}

class OrdTools {
    public static inline function lt<T: Ord<T>>(o1: T, o2: T): Bool {
        return o1.cmp(o2) < 0;
    }

    public static inline function le<T: Ord<T>>(o1: T, o2: T): Bool {
        return o1.cmp(o2) <= 0;
    }

    public static inline function gt<T: Ord<T>>(o1: T, o2: T): Bool {
        return o1.cmp(o2) > 0;
    }

    public static inline function ge<T: Ord<T>>(o1: T, o2: T): Bool {
        return o1.cmp(o2) >= 0;
    }

    public static inline function ordEq<T: Ord<T>>(o1: T, o2: T): Bool {
        return o1.cmp(o2) == 0;
    }
}
