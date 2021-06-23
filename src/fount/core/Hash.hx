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

private class SipState {
    static final INIT0 = Int64.make(0x736f6d65, 0x70736575);
    static final INIT1 = Int64.make(0x646f7261, 0x6e646f6d);
    static final INIT2 = Int64.make(0x6c796765, 0x6e657261);
    static final INIT3 = Int64.make(0x74656462, 0x79746573);

    public var v0: Int64;
    public var v1: Int64;
    public var v2: Int64;
    public var v3: Int64;

    public function new(k0: Int64, k1: Int64) {
        this.v0 = k0 ^ INIT0;
        this.v1 = k1 ^ INIT1;
        this.v2 = k0 ^ INIT2;
        this.v3 = k1 ^ INIT3;
    }
}

class Sip24 implements IHasher {
    final buf: BytesBuffer;
    final state: SipState;

    public static inline function empty(): Sip24 {
        return new Sip24(0, 0);
    }

    public static inline function withKey(k0: Int64, k1: Int64): Sip24 {
        return new Sip24(k0, k1);
    }

    function new(k0: Int64, k1: Int64) {
        this.buf = new BytesBuffer();
        this.state = new SipState(k0, k1);
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
        // padding for final word
        final wordCount = ((buf.length + 1) / 8).ceil();
        for (_ in buf.length...wordCount * 8 - 1) buf.addByte(0);
        buf.addByte(wordCount & 0xff);

        // compression
        final data = buf.getBytes();
        for (i in 0...wordCount) {
            final w = data.getInt64(8 * i);
            compress(w);
        }

        return finalize();
    }

    inline function transform(): Void {
        state.v0 += state.v1;
        state.v1 = state.v1.rol(13);
        state.v1 ^= state.v0;
        state.v0 = state.v0.rol(32);
        state.v2 += state.v3;
        state.v3 = state.v3.rol(16);
        state.v3 ^= state.v2;
        state.v0 += state.v3;
        state.v3 = state.v3.rol(21);
        state.v3 ^= state.v0;
        state.v2 += state.v1;
        state.v1 = state.v1.rol(17);
        state.v1 ^= state.v2;
        state.v2 = state.v2.rol(32);
    }

    inline function compress(word: Int64): Void {
        state.v3 ^= word;
        transform();
        transform();
        state.v0 ^= word;
    }

    inline function finalize(): Int64 {
        state.v2 ^= 0xff;
        transform();
        transform();
        transform();
        transform();
        return state.v0 ^ state.v1 ^ state.v2 ^ state.v3;
    }
}
