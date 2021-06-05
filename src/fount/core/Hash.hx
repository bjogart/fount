package fount.base;

import haxe.Int32;
import haxe.Int64;

typedef Hash = {
    function hash(hasher: Hasher): Void;
}

interface IHash {
    function hash(hasher: Hasher): Void;
}

typedef Hasher = {
    function addInt32(i: Int32): Void;
    function addInt64(i: Int64): Void;
    function hash(): Int64;
}

interface IHasher {
    function addInt32(i: Int32): Void;
    function addInt64(i: Int64): Void;
    function hash(): Int64;
}
