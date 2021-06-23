package tests;

import tests.data.Obj;
import utest.Assert;
import utest.ITest;

using fount.Core;

class TestOptionTools implements ITest {
    public function new() {}

    function test_expect_throws_on_None() {
        final val = None;
        Assert.raises(val.expect.bind("expected value"));
    }

    function test_expect_unwraps_Some() {
        final val = Some(1);
        Assert.equals(1, val.expect("expected 1"));
    }

    function test_filter_does_nothing_on_None_vars() {
        final val: Option<Int> = None;

        Assert.isTrue(val.filter(IntTools.isEven).isNone());
    }

    function test_filter_evaluates_to_on_false_pred() {
        final val: Option<Int> = Some(1);

        Assert.isTrue(val.filter(IntTools.isEven).isNone());
    }

    function test_filter_keeps_val_if_pred_is_true() {
        final val: Option<Int> = Some(2);

        Assert.equals(2, val.filter(IntTools.isEven).unwrap());
    }

    function test_map_does_nothing_on_None() {
        final val: Option<Int> = None;

        Assert.equals(None, val.map(i -> i + 1));
    }

    function test_map_maps_on_Some() {
        final val: Option<Int> = Some(1);

        Assert.equals(2, val.map(i -> i + 1).unwrap());
    }

    function test_mapOr_defaults_on_None() {
        final val: Option<Int> = None;

        Assert.equals(10, val.mapOr(i -> i + 1, 10));
    }

    function test_mapOr_maps_on_Some() {
        final val: Option<Int> = Some(1);

        Assert.equals(2, val.mapOr(i -> i + 1, 10));
    }

    function test_unwrap_throws_on_None() {
        final val = None;
        Assert.raises(val.unwrap);
    }

    function test_unwrap_unwraps_Some() {
        final val = Some(1);
        Assert.equals(1, val.unwrap());
    }

    function test_unwrapOr_returns_default_value_on_None() {
        final val: Option<Int> = None;
        Assert.equals(2, val.unwrapOr(2));
    }

    function test_unwrapOr_unwraps_Some() {
        final val = Some(1);
        Assert.equals(1, val.unwrapOr(2));
    }

    function test_unwrapOrElse_evaluates_fallback_on_None() {
        final val: Option<Int> = None;
        Assert.equals(2, val.unwrapOrElse(() -> 2));
    }

    function test_unwrapOrElse_unwraps_Some() {
        final val = Some(1);
        Assert.equals(1, val.unwrapOrElse(() -> 2));
    }

    function test_eq_on_double_none() {
        final v1 = None;
        final v2 = None;
        Assert.isTrue(v1.eq(v2));
        Assert.isTrue(v2.eq(v1));
    }

    function test_eq_is_false_on_single_none() {
        final v1 = Some(new Obj(0));
        final v2 = None;
        Assert.isFalse(v1.eq(v2));
        Assert.isFalse(v2.eq(v1));
    }

    function test_eq_is_true_for_same_objects() {
        final v1 = Some(new Obj(0));
        final v2 = Some(new Obj(0));
        Assert.isTrue(v1.eq(v2));
        Assert.isTrue(v2.eq(v1));
    }

    function test_eq_is_false_for_different_objects() {
        final v1 = Some(new Obj(0));
        final v2 = Some(new Obj(1));
        Assert.isFalse(v1.eq(v2));
        Assert.isFalse(v2.eq(v1));
    }

    function test_ne_on_double_none() {
        final v1 = None;
        final v2 = None;
        Assert.isFalse(v1.ne(v2));
        Assert.isFalse(v2.ne(v1));
    }

    function test_ne_is_true_on_single_none() {
        final v1 = Some(new Obj(0));
        final v2 = None;
        Assert.isTrue(v1.ne(v2));
        Assert.isTrue(v2.ne(v1));
    }

    function test_ne_is_false_for_same_objects() {
        final v1 = Some(new Obj(0));
        final v2 = Some(new Obj(0));
        Assert.isFalse(v1.ne(v2));
        Assert.isFalse(v2.ne(v1));
    }

    function test_ne_is_true_for_different_objects() {
        final v1 = Some(new Obj(0));
        final v2 = Some(new Obj(1));
        Assert.isTrue(v1.ne(v2));
        Assert.isTrue(v2.ne(v1));
    }

    function test_cmp_counts_double_none_as_equal() {
        final v1 = None;
        final v2 = None;
        Assert.equals(0, v1.cmp(v2));
    }

    function test_cmp_counts_single_none_as_smaller() {
        final v1 = None;
        final v2 = Some(new Obj(1));
        Assert.equals(-1, v1.cmp(v2));
        Assert.equals(1, v2.cmp(v1));
    }

    function test_cmp_counts_somes_by_value() {
        final v1 = Some(new Obj(0));
        final v2 = Some(new Obj(0));
        Assert.equals(0, v1.cmp(v2));
        Assert.equals(0, v2.cmp(v1));
        final v3 = Some(new Obj(1));
        Assert.equals(-1, v1.cmp(v3));
        Assert.equals(1, v3.cmp(v1));
    }
}
