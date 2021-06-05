package fount.base;

import haxe.io.Bytes;
import haxe.Int32;

using fount.Core;

class FloatTools {
    public static inline final ROUNDOFF: Float = 1e-5;

    public static inline function eq(f1: Float, f2: Float): Bool {
        return (f1 - f2).abs() <= ROUNDOFF;
    }

    public static inline function ne(f1: Float, f2: Float): Bool {
        return (f1 - f2).abs() > ROUNDOFF;
    }

    public static inline function cmp(f1: Float, f2: Float): Int32 {
        final cmp = f1 - f2;
        return cmp.abs() <= ROUNDOFF ? 0 : cmp.sign();
    }

    public static inline function lt(f1: Float, f2: Float): Bool {
        return (f1 - f2).abs() <= ROUNDOFF ? false : f1 < f2;
    }

    public static inline function le(f1: Float, f2: Float): Bool {
        return (f1 - f2).abs() <= ROUNDOFF ? true : f1 <= f2;
    }

    public static inline function gt(f1: Float, f2: Float): Bool {
        return (f1 - f2).abs() <= ROUNDOFF ? false : f1 > f2;
    }

    public static inline function ge(f1: Float, f2: Float): Bool {
        return (f1 - f2).abs() <= ROUNDOFF ? true : f1 >= f2;
    }

    public static inline function sign(f: Float): Int {
        return if (f > 0.0) {
            1;
        } else if (f < 0.0) {
            -1;
        } else {
            0;
        }
    }

    public static function hash(f: Float, hasher: Hasher): Void {
        final bytes = Bytes.alloc(8);
        bytes.setDouble(0, f);
        hasher.addInt64(bytes.getInt64(0));
    }

    public static inline function min(f1: Float, f2: Float): Float {
        return f1 <= f2 ? f1 : f2;
    }

    public static inline function max(f1: Float, f2: Float): Float {
        return f1 <= f2 ? f2 : f1;
    }

    public static function clamp(f: Float, min: Float, max: Float): Float {
        return f.min(max).max(min);
    }

    public static inline function abs(f: Float): Float {
        return f < 0 ? -f : f;
    }

    public static inline function floor(f: Float): Int {
        return Math.floor(f);
    }

    public static inline function ceil(f: Float): Int {
        return Math.ceil(f);
    }

    public static inline function round(f: Float): Int {
        return Math.round(f);
    }

    public static inline function pow(f: Float, e: Float): Float {
        return Math.pow(f, e);
    }

    public static inline function ln(f: Float): Float {
        return Math.log(f);
    }

    public static inline function log2(f: Float): Float {
        return f.log(2.0);
    }

    public static inline function log(f: Float, base: Float): Float {
        return f.ln() / base.ln();
    }

    public static inline function sqrt(f: Float): Float {
        return Math.sqrt(f);
    }

    public static inline function isNaN(f: Float): Bool {
        return Math.isNaN(f);
    }

    public static inline function isFinite(f: Float): Bool {
        return Math.isFinite(f);
    }

    public static inline function toInt(f: Float): Int {
        return Std.int(f);
    }

    // based on https://stackoverflow.com/a/48154183
    public static function toStr(f: Float, precision: Int): String {
        if (f.isNaN()) return "NaN";
        if (f == 0.0) return '0.${"0".repeat(precision)}';

        final buf = new StringBuf();
        if (f < 0.0) buf.addChar("-".code);
        if (!f.isFinite()) {
            buf.add("inf");
            return buf.toString();
        }

        f = f.abs();
        var p = 10.pow(precision);
        final ipart = f.floor();
        final fpart = ((f - ipart) * p).round();

        buf.add(ipart);
        if (fpart == 0) {
            buf.addChar(".".code);
            for (_ in 0...precision) buf.addChar("0".code);
        } else {
            buf.add(".");

            p /= 10;
            while (fpart < p) {
                p /= 10;
                buf.addChar("0".code);
            }
            buf.add(fpart);
        }

        return buf.toString();
    }

    public static inline function toRepr(f: Float, precision: Int): String {
        return '${f.toStr(precision)}f';
    }
}
