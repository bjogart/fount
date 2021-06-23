package tests.data;

using fount.Core;

class Obj implements IEq<Obj> implements IHash implements IOrd<Obj> implements IDisplay implements IDebug {
    final i: Int;

    public function new(i: Int) {
        this.i = i;
    }

    public function eq(o: Obj): Bool {
        return i.eq(o.i);
    }

    public function hash(hasher: Hasher): Void {
        hasher.i32(i);
    }

    public function cmp(o: Obj): Int {
        return i.cmp(o.i);
    }

    public function toStr(): String {
        return i.toStr();
    }

    public function toRepr(): String {
        return 'Obj(${i.toRepr()})';
    }
}
