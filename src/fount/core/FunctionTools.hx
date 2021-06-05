package fount.core;

class FunctionTools {
    public static inline function let<T, R>(v: T, fun: T -> R): R {
        return fun(v);
    }

    public static inline function also<T>(v: T, fun: T -> Void): T {
        fun(v);
        return v;
    }
}
