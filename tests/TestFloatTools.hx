package tests;

import utest.Assert;
import utest.ITest;

using fount.Core;

class TestFloatTools implements ITest {
    public function new() {}

    function test_eq_is_false_for_different_numbers() {
        Assert.isFalse(5.0.eq(6.0));
    }

    function test_eq_is_true_for_equal_numbers() {
        Assert.isTrue(5.0.eq(5.0));
    }

    function test_eq_is_true_for_rounds() {
        Assert.isTrue((10.0 / 3.0).eq(20.0 / 6.0));
    }

    function test_ne_is_true_for_different_numbers() {
        Assert.isTrue(5.0.ne(6.0));
    }

    function test_ne_is_false_for_equal_numbers() {
        Assert.isFalse(5.0.ne(5.0));
    }

    function test_ne_is_false_for_rounds() {
        Assert.isFalse((10.0 / 3.0).ne(20.0 / 6.0));
    }

    function test_cmp_is_0_if_values_are_considered_equal_by_eq() {
        Assert.equals(5.0.cmp(5.0), 0);
        Assert.equals((10.0 / 3.0).cmp(20.0 / 6.0), 0);
    }

    function test_cmp_is_neg_1_if_left_is_smaller_than_right() {
        Assert.equals(5.0.cmp(6.0), -1);
    }

    function test_cmp_is_1_if_right_is_smaller_than_left() {
        Assert.equals(6.0.cmp(5.0), 1);
    }

    function test_lt() {
        Assert.isFalse(6.0.lt(5.0));
        Assert.isTrue(5.0.lt(6.0));
        Assert.isFalse(5.0.lt(5.0));
    }

    function test_le() {
        Assert.isFalse(6.0.le(5.0));
        Assert.isTrue(5.0.le(6.0));
        Assert.isTrue(5.0.le(5.0));
    }

    function test_gt() {
        Assert.isTrue(6.0.gt(5.0));
        Assert.isFalse(5.0.gt(6.0));
        Assert.isFalse(5.0.gt(5.0));
    }

    function test_ge() {
        Assert.isTrue(6.0.ge(5.0));
        Assert.isFalse(5.0.ge(6.0));
        Assert.isTrue(5.0.ge(5.0));
    }

    function test_sign_is_0_if_float_is_0() {
        Assert.equals(0.0.sign(), 0);
    }

    function test_sign_is_1_if_float_is_positive() {
        Assert.equals(1.0.sign(), 1);
    }

    function test_sign_is_neg_1_if_float_is_negative() {
        Assert.equals((-1.0).sign(), -1);
    }

    function test_either_value_is_min_if_operands_are_equal() {
        Assert.isTrue(5.0.min(5.0).eq(5.0));
    }

    function test_left_value_is_min_if_left_is_smaller_than_right() {
        Assert.isTrue(5.0.min(10.0).eq(5.0));
    }

    function test_right_value_is_min_if_left_is_larger_than_right() {
        Assert.isTrue(10.0.min(5.0).eq(5.0));
    }

    function test_either_value_is_max_if_operands_are_equal() {
        Assert.isTrue(5.0.max(5.0).eq(5.0));
    }

    function test_right_value_is_min_if_left_is_smaller_than_right() {
        Assert.isTrue(5.0.max(10.0).eq(10.0));
    }

    function test_right_value_is_max_if_left_is_larger_than_right() {
        Assert.isTrue(10.0.max(5.0).eq(10.0));
    }

    function test_clamp_is_noop_if_val_is_in_range() {
        Assert.isTrue(2.0.clamp(1.0, 3.0).eq(2.0));
    }

    function test_clamp_is_min_if_val_is_smaller() {
        Assert.isTrue(0.0.clamp(1.0, 3.0).eq(1.0));
    }

    function test_clamp_is_max_if_val_is_larger() {
        Assert.isTrue(4.0.clamp(1.0, 3.0).eq(3.0));
    }

    function test_abs_is_val_if_val_is_0_or_more() {
        Assert.isTrue(0.0.abs().eq(0.0));
        Assert.isTrue(3.0.abs().eq(3.0));
    }

    function test_abs_is_pos_val_if_val_is_negative() {
        Assert.isTrue((-1.0).abs().eq(1.0));
    }

    function test_floor() {
        for (i in 0...10) Assert.equals((i / 10.0).floor(), 0);
    }

    function test_ceil() {
        for (i in 1...10) Assert.equals((i / 10.0).ceil(), 1);
    }

    function test_round() {
        for (i in 0...5) Assert.equals((i / 10.0).round(), 0);
        for (i in 5...10) Assert.equals((i / 10.0).round(), 1);
    }

    function test_toStr_checks_for_NaN() {
        Assert.equals(Math.NaN.toStr(2), "NaN");
    }

    function test_toStr_adds_appropriate_number_of_trailing_0s_for_value_0() {
        for (i in 0...10) Assert.equals(0.0.toStr(i), "0." + "0".repeat(i));
    }

    function test_toStr_catches_positive_and_negative_infinity() {
        Assert.equals(Math.POSITIVE_INFINITY.toStr(1), "inf");
        Assert.equals(Math.NEGATIVE_INFINITY.toStr(1), "-inf");
    }

    function test_toStr_adds_trailing_0s_for_finite_decimals() {
        Assert.equals(4.2.toStr(1), "4.2");
        Assert.equals(4.2.toStr(3), "4.200");
    }

    function test_toStr_adds_sign_to_negative_numbers() {
        Assert.equals((-0.0).toStr(1), "0.0");
        Assert.equals((-1.0).toStr(1), "-1.0");
        Assert.equals((-15.0).toStr(1), "-15.0");
    }

    function test_toStr_rounds_cutoff_correctly() {
        for (i in 1...10) {
            Assert.equals((10.0 / 3.0).toStr(i), "3." + "3".repeat(i));
            Assert.equals((20.0 / 3.0).toStr(i), "6." + "6".repeat(i - 1) + "7");
        }
    }
}
