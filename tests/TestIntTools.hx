package tests;

import utest.Assert;
import utest.ITest;

using fount.Core;

class TestIntTools implements ITest {
    public function new() {}

    function test_0_is_an_even_number() {
        Assert.isTrue(0.isEven());
    }

    function test_1_is_not_an_even_number() {
        Assert.isFalse(1.isEven());
    }

    function test_minus_23_is_not_an_even_number() {
        Assert.isFalse((-23).isEven());
    }

    function test_minus_42_is_an_even_number() {
        Assert.isTrue((-42).isEven());
    }

    function test_min_of_1_and_2_is_1() {
        Assert.equals(1, 1.min(2));
    }

    function test_min_of_2_and_1_is_1() {
        Assert.equals(1, 2.min(1));
    }

    function test_min_of_unparenthesized_neg_1_and_2_is_1() {
        Assert.equals(-1, -1.min(2));
    }

    function test_min_of_parenthesized_neg_1_and_2_is_neg_1() {
        Assert.equals(-1, (-1).min(2));
    }

    function test_max_of_1_and_2_is_2() {
        Assert.equals(2, 1.max(2));
    }

    function test_max_of_2_and_1_is_2() {
        Assert.equals(2, 2.max(1));
    }

    function test_max_of_unparenthesized_neg_3_and_2_is_3() {
        Assert.equals(-3, -3.max(2)); // minus is applied to entire expression
    }

    function test_max_of_parenthesized_neg_1_and_2_is_2() {
        Assert.equals(2, (-1).max(2));
    }

    function test_lt() {
        Assert.isFalse(6.lt(5));
        Assert.isTrue(5.lt(6));
        Assert.isFalse(5.lt(5));
    }

    function test_le() {
        Assert.isFalse(6.le(5));
        Assert.isTrue(5.le(6));
        Assert.isTrue(5.le(5));
    }

    function test_gt() {
        Assert.isTrue(6.gt(5));
        Assert.isFalse(5.gt(6));
        Assert.isFalse(5.gt(5));
    }

    function test_ge() {
        Assert.isTrue(6.ge(5));
        Assert.isFalse(5.ge(6));
        Assert.isTrue(5.ge(5));
    }

    function test_eq_is_false_for_different_numbers() {
        Assert.isFalse(5.eq(6));
    }

    function test_eq_is_true_for_equal_numbers() {
        Assert.isTrue(5.eq(5));
    }

    function test_ne_is_true_for_different_numbers() {
        Assert.isTrue(5.ne(6));
    }

    function test_ne_is_false_for_equal_numbers() {
        Assert.isFalse(5.ne(5));
    }
}
