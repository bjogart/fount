package fount.base;

import haxe.Exception;

using fount.Core;

class OptionTools {
    public static function expect<T>(v: Option<T>, msg: String): T {
        switch v {
            case Some(v): return v;
            case None: throw new Exception(msg);
        }
    }

    public static function isSome<T>(v: Option<T>): Bool {
        return v.match(Some(_));
    }

    public static function isNone<T>(v: Option<T>): Bool {
        return v.match(None);
    }

    public static function filter<T>(v: Option<T>, pred: T -> Bool): Option<T> {
        return switch v {
            case Some(val): pred(val) ? v : None;
            case None: None;
        }
    }

    public static function map<T, R>(v: Option<T>, fun: T -> R): Option<R> {
        return switch v {
            case Some(v): Some(fun(v));
            case None: None;
        }
    }

    public static function mapOr<T, R>(v: Option<T>, fun: T -> R, def: R): R {
        return switch v {
            case Some(v): fun(v);
            case None: def;
        }
    }

    public static function unwrap<T>(v: Option<T>): T {
        switch v {
            case Some(v): return v;
            case None: throw new Exception("unwrap() called on None");
        }
    }

    public static function unwrapOr<T>(v: Option<T>, def: T): T {
        return switch v {
            case Some(v): v;
            case None: def;
        }
    }

    public static function unwrapOrElse<T>(v: Option<T>, fallback: () -> T): T {
        return switch v {
            case Some(v): v;
            case None: fallback();
        }
    }

    public static inline function eq<T: Eq<T>>(v1: Option<T>, v2: Option<T>): Bool {
        return eqBy(v1, v2, (v1, v2) -> v1.eq(v2));
    }

    public static function eqBy<T>(v1: Option<T>, v2: Option<T>, eq: (T, T) -> Bool): Bool {
        return switch [v1, v2] {
            case [Some(v1), Some(v2)]: eq(v1, v2);
            case [None, None]: true;
            case _: false;
        }
    }

    public static inline function ne<T: Eq<T>>(v1: Option<T>, v2: Option<T>): Bool {
        return neBy(v1, v2, (v1, v2) -> v1.ne(v2));
    }

    public static function neBy<T>(v1: Option<T>, v2: Option<T>, ne: (T, T) -> Bool): Bool {
        return switch [v1, v2] {
            case [Some(v1), Some(v2)]: ne(v1, v2);
            case [None, None]: false;
            case _: true;
        }
    }

    public static inline function cmp<T: Ord<T>>(v1: Option<T>, v2: Option<T>): Int {
        return cmpBy(v1, v2, (v1, v2) -> v1.cmp(v2));
    }

    public static function cmpBy<T>(v1: Option<T>, v2: Option<T>, cmp: (T, T) -> Int): Int {
        return switch [v1, v2] {
            case [Some(v1), Some(v2)]: cmp(v1, v2);
            case [Some(_), None]: 1;
            case [None, Some(_)]: -1;
            case _: 0;
        }
    }

    public static inline function lt<T: Ord<T>>(v1: Option<T>, v2: Option<T>): Bool {
        return ltBy(v1, v2, (v1, v2) -> v1.cmp(v2));
    }

    public static inline function ltBy<T: Ord<T>>(v1: Option<T>, v2: Option<T>, cmp: (T, T) -> Int): Bool {
        return cmpBy(v1, v2, cmp) < 0;
    }

    public static inline function le<T: Ord<T>>(v1: Option<T>, v2: Option<T>): Bool {
        return leBy(v1, v2, (v1, v2) -> v1.cmp(v2));
    }

    public static inline function leBy<T: Ord<T>>(v1: Option<T>, v2: Option<T>, cmp: (T, T) -> Int): Bool {
        return cmpBy(v1, v2, cmp) <= 0;
    }

    public static inline function gt<T: Ord<T>>(v1: Option<T>, v2: Option<T>): Bool {
        return gtBy(v1, v2, (v1, v2) -> v1.cmp(v2));
    }

    public static inline function gtBy<T: Ord<T>>(v1: Option<T>, v2: Option<T>, cmp: (T, T) -> Int): Bool {
        return cmpBy(v1, v2, cmp) > 0;
    }

    public static inline function ge<T: Ord<T>>(v1: Option<T>, v2: Option<T>): Bool {
        return gtBy(v1, v2, (v1, v2) -> v1.cmp(v2));
    }

    public static inline function geBy<T: Ord<T>>(v1: Option<T>, v2: Option<T>, cmp: (T, T) -> Int): Bool {
        return cmpBy(v1, v2, cmp) >= 0;
    }
}
