package fount.core;

class FunTools {
    public static inline function let<T, R>(v: T, fun: T -> R): R {
        return fun(v);
    }

    public static inline function also<T>(v: T, fun: T -> Void): T {
        fun(v);
        return v;
    }

    public static inline function id<T>(v: T): T {
        return v;
    }
}
