package fount.base;

import haxe.iterators.StringIteratorUnicode;

using fount.Core;

class StringTools {
    public static function repeat(str: String, n: Int): String {
        final buf = new StringBuf();
        for (_ in 0...n) buf.add(str);
        return buf.toString();
    }

    public static function reverse(str: String): String {
        final buf = new StringBuf();
        var i = str.length - 1;
        while (i >= 0) buf.add(str.charAt(i--));
        return buf.toString();
    }

    public static function toInt(str: String): Option<Int> {
        final i = Std.parseInt(str);
        return i == null ? None : Some(i);
    }

    public static function toFloat(str: String): Option<Float> {
        final f = Std.parseFloat(str);
        return f.isNaN() ? None : Some(f);
    }

    public static inline function iterator(str: String): Iterator<Int> {
        return new StringIteratorUnicode(str);
    }

    public static inline function replace(str: String, re: EReg, by: String): String {
        return re.replace(str, by);
    }

    public static function escape(str: String): String {
        return str.replace(~/\\/g, "\\\\").replace(~/\t/g, "\\t").replace(~/\r/g, "\\r").replace(~/\n/g, "\\n").replace(~/"/g, '\\"');
    }

    public static inline function toRepr(str: String): String {
        return '"${str.toRepr()}"';
    }

    public static function eq(s1: String, s2: String): Bool {
        return s1 == s2;
    }

    public static function ne(s1: String, s2: String): Bool {
        return s1 != s2;
    }

    public static function cmp(s1: String, s2: String): Int {
        for (i in 0...s1.length.min(s2.length)) {
            @:nullSafety(Off) final cmp = s1.charCodeAt(i).cmp(s2.charCodeAt(i));
            if (cmp != 0) return cmp;
        }
        return s1.length.cmp(s2.length);
    }

    public static inline function lt(s1: String, s2: String): Bool {
        return cmp(s1, s2) < 0;
    }

    public static inline function le(s1: String, s2: String): Bool {
        return cmp(s1, s2) <= 0;
    }

    public static inline function gt(s1: String, s2: String): Bool {
        return cmp(s1, s2) > 0;
    }

    public static inline function ge(s1: String, s2: String): Bool {
        return cmp(s1, s2) >= 0;
    }

    public static function hash(s: String, hasher: Hasher): Void {
        for (c in s.iterator()) hasher.addInt32(c);
    }
}
