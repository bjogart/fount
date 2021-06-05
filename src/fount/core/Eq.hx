package fount.core;

typedef Eq<T> = {
    function eq(o: T): Bool;
}

interface IEq<T> {
    function eq(o: T): Bool;
}

class EqTools {
    public static inline function ne<T: Eq<T>>(o1: T, o2: T): Bool {
        return !o1.eq(o2);
    }
}
