package fount.core;

import haxe.io.BytesBuffer;

using fount.Core;

typedef Hash = {
    function hash(hasher: Hasher): Void;
}

interface IHash {
    function hash(hasher: Hasher): Void;
}

typedef Hasher = {
    function bool(b: Bool): Void;
    function i32(i: Int32): Void;
    function i64(i: Int64): Void;
    function f64(f: Float): Void;
    function str(s: String): Void;
    function hash(): Int64;
}

interface IHasher {
    function bool(b: Bool): Void;
    function i32(i: Int32): Void;
    function i64(i: Int64): Void;
    function f64(f: Float): Void;
    function str(s: String): Void;
    function hash(): Int64;
}

private class Sip24State {
    static final INIT0 = Int64.make(0x736f6d65, 0x70736575);
    static final INIT1 = Int64.make(0x646f7261, 0x6e646f6d);
    static final INIT2 = Int64.make(0x6c796765, 0x6e657261);
    static final INIT3 = Int64.make(0x74656462, 0x79746573);

    var v0: Int64;
    var v1: Int64;
    var v2: Int64;
    var v3: Int64;

    public function new(k0: Int64, k1: Int64) {
        this.v0 = k0 ^ INIT0;
        this.v1 = k1 ^ INIT1;
        this.v2 = k0 ^ INIT2;
        this.v3 = k1 ^ INIT3;
    }

    inline function transform(): Void {
        v0 += v1;
        v1 = v1.rol(13);
        v1 ^= v0;
        v0 = v0.rol(32);
        v2 += v3;
        v3 = v3.rol(16);
        v3 ^= v2;
        v0 += v3;
        v3 = v3.rol(21);
        v3 ^= v0;
        v2 += v1;
        v1 = v1.rol(17);
        v1 ^= v2;
        v2 = v2.rol(32);
    }

    public function compress(word: Int64): Void {
        v3 ^= word;
        transform();
        transform();
        v0 ^= word;
    }

    public function finalize(): Int64 {
        v2 ^= 0xff;
        transform();
        transform();
        transform();
        transform();
        return v0 ^ v1 ^ v2 ^ v3;
    }
}

class Sip24 implements IHasher {
    final buf: BytesBuffer;
    final k0: Int64;
    final k1: Int64;

    public static inline function empty(): Sip24 {
        return new Sip24(0, 0);
    }

    public static inline function withKey(k0: Int64, k1: Int64): Sip24 {
        return new Sip24(k0, k1);
    }

    function new(k0: Int64, k1: Int64) {
        this.buf = new BytesBuffer();
        this.k0 = k0;
        this.k1 = k1;
    }

    public function bool(b: Bool): Void {
        buf.addByte(b ? 0xff : 0x00);
    }

    public function i32(i: Int32): Void {
        buf.addInt32(i);
    }

    public function i64(i: Int64): Void {
        buf.addInt64(i);
    }

    public function f64(f: Float): Void {
        buf.addFloat(f);
    }

    public function str(s: String): Void {
        buf.addString(s, UTF8);
    }

    public function hash(): Int64 {
        trace(buf.length);
        // padding for final word
        final wordCount = ((buf.length + 1) / 8).ceil();
        for (_ in buf.length...wordCount * 8 - 1) buf.addByte(0);
        buf.addByte(wordCount & 0xff);

        final state = new Sip24State(k0, k1);

        // compression
        trace(buf.length);
        final data = buf.getBytes();
        trace(data.length);
        for (i in 0...wordCount) {
            final w = data.getInt64(8 * i);
            state.compress(w);
        }

        return state.finalize();
    }
}
