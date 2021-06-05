package tests;

import utest.Assert;
import utest.ITest;

using fount.Core;

class TestIntTools implements ITest {
    static final HEX_VALUES = [
        "0",
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "a",
        "b",
        "c",
        "d",
        "e",
        "f",
        "10",
        "11",
        "12",
        "13",
        "14",
        "15",
        "16",
        "17",
        "18",
        "19",
        "1a",
        "1b",
        "1c",
        "1d",
        "1e",
        "1f",
        "20",
        "21",
        "22",
        "23",
        "24",
        "25",
        "26",
        "27",
        "28",
        "29",
        "2a",
        "2b",
        "2c",
        "2d",
        "2e",
        "2f",
        "30",
        "31",
        "32",
        "33",
        "34",
        "35",
        "36",
        "37",
        "38",
        "39",
        "3a",
        "3b",
        "3c",
        "3d",
        "3e",
        "3f",
        "40",
        "41",
        "42",
        "43",
        "44",
        "45",
        "46",
        "47",
        "48",
        "49",
        "4a",
        "4b",
        "4c",
        "4d",
        "4e",
        "4f",
        "50",
        "51",
        "52",
        "53",
        "54",
        "55",
        "56",
        "57",
        "58",
        "59",
        "5a",
        "5b",
        "5c",
        "5d",
        "5e",
        "5f",
        "60",
        "61",
        "62",
        "63",
        "64",
        "65",
        "66",
        "67",
        "68",
        "69",
        "6a",
        "6b",
        "6c",
        "6d",
        "6e",
        "6f",
        "70",
        "71",
        "72",
        "73",
        "74",
        "75",
        "76",
        "77",
        "78",
        "79",
        "7a",
        "7b",
        "7c",
        "7d",
        "7e",
        "7f",
        "80",
        "81",
        "82",
        "83",
        "84",
        "85",
        "86",
        "87",
        "88",
        "89",
        "8a",
        "8b",
        "8c",
        "8d",
        "8e",
        "8f",
        "90",
        "91",
        "92",
        "93",
        "94",
        "95",
        "96",
        "97",
        "98",
        "99",
        "9a",
        "9b",
        "9c",
        "9d",
        "9e",
        "9f",
        "a0",
        "a1",
        "a2",
        "a3",
        "a4",
        "a5",
        "a6",
        "a7",
        "a8",
        "a9",
        "aa",
        "ab",
        "ac",
        "ad",
        "ae",
        "af",
        "b0",
        "b1",
        "b2",
        "b3",
        "b4",
        "b5",
        "b6",
        "b7",
        "b8",
        "b9",
        "ba",
        "bb",
        "bc",
        "bd",
        "be",
        "bf",
        "c0",
        "c1",
        "c2",
        "c3",
        "c4",
        "c5",
        "c6",
        "c7",
        "c8",
        "c9",
        "ca",
        "cb",
        "cc",
        "cd",
        "ce",
        "cf",
        "d0",
        "d1",
        "d2",
        "d3",
        "d4",
        "d5",
        "d6",
        "d7",
        "d8",
        "d9",
        "da",
        "db",
        "dc",
        "dd",
        "de",
        "df",
        "e0",
        "e1",
        "e2",
        "e3",
        "e4",
        "e5",
        "e6",
        "e7",
        "e8",
        "e9",
        "ea",
        "eb",
        "ec",
        "ed",
        "ee",
        "ef",
        "f0",
        "f1",
        "f2",
        "f3",
        "f4",
        "f5",
        "f6",
        "f7",
        "f8",
        "f9",
        "fa",
        "fb",
        "fc",
        "fd",
        "fe",
        "ff"
    ];

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

    function test_toHexStr_on_values() {
        for (i => str in HEX_VALUES) Assert.equals(str, i.toHexStr());
    }
}
