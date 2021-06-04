package tests;

import utest.Assert;
import utest.ITest;
import tests.ds.Obj;

using tink.CoreApi;
using fount.Core;

class TestPairTools implements ITest {
    public function new() {}

    function test_eq_is_true_for_nil_pairs() {
        final p1 = Pair.nil();
        final p2 = Pair.nil();
        Assert.isTrue(p1.eq(p2));
        Assert.isTrue(p2.eq(p1));
    }

    function test_eq_is_false_for_single_nil_pair() {
        final p1 = new Pair(new Obj(0), new Obj(1));
        final p2 = Pair.nil();
        Assert.isFalse(p1.eq(p2));
        Assert.isFalse(p2.eq(p1));
    }

    function test_eq_is_true_for_equal_pairs() {
        final p1 = new Pair(new Obj(0), new Obj(1));
        final p2 = new Pair(new Obj(0), new Obj(1));
        Assert.isTrue(p1.eq(p2));
        Assert.isTrue(p2.eq(p1));
    }

    function test_eq_is_false_for_unequal_pairs() {
        final p1 = new Pair(new Obj(0), new Obj(1));
        final p2 = new Pair(new Obj(2), new Obj(3));
        Assert.isFalse(p1.eq(p2));
        Assert.isFalse(p2.eq(p1));
    }

    function test_eq_is_false_for_flipped_pairs() {
        final p1 = new Pair(new Obj(0), new Obj(1));
        final p2 = new Pair(new Obj(1), new Obj(0));
        Assert.isFalse(p1.eq(p2));
        Assert.isFalse(p2.eq(p1));
    }

    function test_ne_is_false_for_nil_pairs() {
        final p1 = Pair.nil();
        final p2 = Pair.nil();
        Assert.isFalse(p1.ne(p2));
        Assert.isFalse(p2.ne(p1));
    }

    function test_ne_is_true_for_single_nil_pair() {
        final p1 = new Pair(new Obj(0), new Obj(1));
        final p2 = Pair.nil();
        Assert.isTrue(p1.ne(p2));
        Assert.isTrue(p2.ne(p1));
    }

    function test_ne_is_false_for_equal_pairs() {
        final p1 = new Pair(new Obj(0), new Obj(1));
        final p2 = new Pair(new Obj(0), new Obj(1));
        Assert.isFalse(p1.ne(p2));
        Assert.isFalse(p2.ne(p1));
    }

    function test_ne_is_true_for_unequal_pairs() {
        final p1 = new Pair(new Obj(0), new Obj(1));
        final p2 = new Pair(new Obj(2), new Obj(3));
        Assert.isTrue(p1.ne(p2));
        Assert.isTrue(p2.ne(p1));
    }

    function test_ne_is_true_for_flipped_pairs() {
        final p1 = new Pair(new Obj(0), new Obj(1));
        final p2 = new Pair(new Obj(1), new Obj(0));
        Assert.isTrue(p1.ne(p2));
        Assert.isTrue(p2.ne(p1));
    }

    function test_cmp_counts_nils_as_eq() {
        final p1 = Pair.nil();
        final p2 = Pair.nil();
        Assert.equals(0, p1.cmp(p2));
    }

    function test_cmp_orders_nil_before_pair() {
        final p1 = new Pair(new Obj(0), new Obj(1));
        final p2 = Pair.nil();
        Assert.equals(1, p1.cmp(p2));
        Assert.equals(-1, p2.cmp(p1));
    }

    function test_cmp_orders_by_argument_in_order() {
        final p1 = new Pair(new Obj(0), new Obj(1));
        final p2 = new Pair(new Obj(1), new Obj(1));
        Assert.equals(-1, p1.cmp(p2));
        Assert.equals(1, p2.cmp(p1));
        final p3 = new Pair(new Obj(0), new Obj(0));
        Assert.equals(1, p1.cmp(p3));
        Assert.equals(-1, p3.cmp(p1));
    }

    function test_cmp_counts_equal_pairs_as_equal() {
        final p1 = new Pair(new Obj(0), new Obj(1));
        final p2 = new Pair(new Obj(0), new Obj(1));
        Assert.equals(0, p1.cmp(p2));
        Assert.equals(0, p2.cmp(p1));
    }

    function test_toStr_with_nil_pair() {
        final p = Pair.nil();
        Assert.equals("()", p.toStr());
    }

    function test_toStr_with_nonnil_pair() {
        final p = new Pair(new Obj(0), new Obj(1));
        Assert.equals("(0, 1)", p.toStr());
    }

    function test_toRepr_with_nil_pair() {
        final p = Pair.nil();
        Assert.equals("Pair()", p.toRepr());
    }

    function test_toRepr_with_nonnil_pair() {
        final p = new Pair(new Obj(0), new Obj(1));
        Assert.equals("Pair(Obj(0i), Obj(1i))", p.toRepr());
    }
}
