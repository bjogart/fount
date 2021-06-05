package fount.core;

using tink.CoreApi;
using fount.Core;

class PairTools {
    public static inline function eq<A: Eq<A>, B: Eq<B>>(p1: Pair<A, B>, p2: Pair<A, B>): Bool {
        return p1.eqBy(p2, (a1, a2) -> a1.eq(a2), (b1, b2) -> b1.eq(b2));
    }

    public static function eqBy<A, B>(p1: Pair<A, B>, p2: Pair<A, B>, eqA: (A, A) -> Bool, eqB: (B, B) -> Bool): Bool {
        return if (!p1) {
            !p2;
        } else if (!p2) {
            false;
        } else {
            eqA(p1.a, p2.a)
            && eqB(p1.b, p2.b);
        }
    }

    public static inline function ne<A: Eq<A>, B: Eq<B>>(p1: Pair<A, B>, p2: Pair<A, B>): Bool {
        return p1.neBy(p2, (a1, a2) -> a1.ne(a2), (b1, b2) -> b1.ne(b2));
    }

    public static function neBy<A, B>(p1: Pair<A, B>, p2: Pair<A, B>, neA: (A, A) -> Bool, neB: (B, B) -> Bool): Bool {
        return if (!p1) {
            !!p2;
        } else if (!p2) {
            true;
        } else {
            neA(p1.a, p2.a)
            || neB(p1.b, p2.b);
        }
    }

    public static inline function cmp<A: Ord<A>, B: Ord<B>>(p1: Pair<A, B>, p2: Pair<A, B>): Int {
        return p1.cmpBy(p2, (a1, a2) -> a1.cmp(a2), (b1, b2) -> b1.cmp(b2));
    }

    public static function cmpBy<A, B>(p1: Pair<A, B>, p2: Pair<A, B>, cmpA: (A, A) -> Int, cmpB: (B, B) -> Int): Int {
        if (!p1) {
            return !p2 ? 0 : -1;
        } else if (!p2) {
            return 1;
        }

        final cmp = cmpA(p1.a, p2.a);
        if (cmp != 0) return cmp;
        return cmpB(p1.b, p2.b);
    }

    public static inline function le<A: Ord<A>, B: Ord<B>>(p1: Pair<A, B>, p2: Pair<A, B>): Bool {
        return p1.cmp(p2) < 0;
    }

    public static inline function lt<A: Ord<A>, B: Ord<B>>(p1: Pair<A, B>, p2: Pair<A, B>): Bool {
        return p1.cmp(p2) <= 0;
    }

    public static inline function ge<A: Ord<A>, B: Ord<B>>(p1: Pair<A, B>, p2: Pair<A, B>): Bool {
        return p1.cmp(p2) > 0;
    }

    public static inline function gt<A: Ord<A>, B: Ord<B>>(p1: Pair<A, B>, p2: Pair<A, B>): Bool {
        return p1.cmp(p2) >= 0;
    }

    public static inline function leBy<A: Ord<A>, B: Ord<B>>(p1: Pair<A, B>, p2: Pair<A, B>, cmpA: (A, A) -> Int, cmpB: (B, B) -> Int): Bool {
        return p1.cmpBy(p2, cmpA, cmpB) < 0;
    }

    public static inline function ltBy<A: Ord<A>, B: Ord<B>>(p1: Pair<A, B>, p2: Pair<A, B>, cmpA: (A, A) -> Int, cmpB: (B, B) -> Int): Bool {
        return p1.cmpBy(p2, cmpA, cmpB) <= 0;
    }

    public static inline function geBy<A: Ord<A>, B: Ord<B>>(p1: Pair<A, B>, p2: Pair<A, B>, cmpA: (A, A) -> Int, cmpB: (B, B) -> Int): Bool {
        return p1.cmpBy(p2, cmpA, cmpB) > 0;
    }

    public static inline function gtBy<A: Ord<A>, B: Ord<B>>(p1: Pair<A, B>, p2: Pair<A, B>, cmpA: (A, A) -> Int, cmpB: (B, B) -> Int): Bool {
        return p1.cmpBy(p2, cmpA, cmpB) >= 0;
    }

    public static inline function hash<A: Hash, B: Hash>(p: Pair<A, B>, hasher: Hasher): Void {
        p.a.hash(hasher);
        p.b.hash(hasher);
    }

    public static inline function hashBy<A, B>(p: Pair<A, B>, hasher: Hasher, hashA: (A, Hasher) -> Void, hashB: (B, Hasher) -> Void): Void {
        hashA(p.a, hasher);
        hashB(p.b, hasher);
    }

    public static inline function toStr<A: Display, B: Display>(p: Pair<A, B>): String {
        final toStr = v -> v.toStr();
        return p.toStrBy(toStr, toStr);
    }

    public static function toStrBy<A, B>(p: Pair<A, B>, toStrA: A -> String, toStrB: B -> String): String {
        final buf = new StringBuf();
        buf.add("(");
        if (!!p) {
            buf.add(toStrA(p.a));
            buf.add(", ");
            buf.add(toStrB(p.b));
        }
        buf.add(")");
        return buf.toString();
    }

    public static inline function toRepr<A: Debug, B: Debug>(p: Pair<A, B>): String {
        final toRepr = v -> v.toRepr();
        return p.toReprBy(toRepr, toRepr);
    }

    public static function toReprBy<A, B>(p: Pair<A, B>, toReprA: A -> String, toReprB: B -> String): String {
        final buf = new StringBuf();
        buf.add("Pair(");
        if (!!p) {
            buf.add(toReprA(p.a));
            buf.add(", ");
            buf.add(toReprB(p.b));
        }
        buf.add(")");
        return buf.toString();
    }
}
