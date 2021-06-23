package tests;

import utest.Assert;
import utest.ITest;

using fount.Core;

class TestIntTools implements ITest {
    static final HEX_VALUES = [
        "00000000",
        "00000001",
        "00000002",
        "00000003",
        "00000004",
        "00000005",
        "00000006",
        "00000007",
        "00000008",
        "00000009",
        "0000000a",
        "0000000b",
        "0000000c",
        "0000000d",
        "0000000e",
        "0000000f",
        "00000010",
        "00000011",
        "00000012",
        "00000013",
        "00000014",
        "00000015",
        "00000016",
        "00000017",
        "00000018",
        "00000019",
        "0000001a",
        "0000001b",
        "0000001c",
        "0000001d",
        "0000001e",
        "0000001f",
        "00000020",
        "00000021",
        "00000022",
        "00000023",
        "00000024",
        "00000025",
        "00000026",
        "00000027",
        "00000028",
        "00000029",
        "0000002a",
        "0000002b",
        "0000002c",
        "0000002d",
        "0000002e",
        "0000002f",
        "00000030",
        "00000031",
        "00000032",
        "00000033",
        "00000034",
        "00000035",
        "00000036",
        "00000037",
        "00000038",
        "00000039",
        "0000003a",
        "0000003b",
        "0000003c",
        "0000003d",
        "0000003e",
        "0000003f",
        "00000040",
        "00000041",
        "00000042",
        "00000043",
        "00000044",
        "00000045",
        "00000046",
        "00000047",
        "00000048",
        "00000049",
        "0000004a",
        "0000004b",
        "0000004c",
        "0000004d",
        "0000004e",
        "0000004f",
        "00000050",
        "00000051",
        "00000052",
        "00000053",
        "00000054",
        "00000055",
        "00000056",
        "00000057",
        "00000058",
        "00000059",
        "0000005a",
        "0000005b",
        "0000005c",
        "0000005d",
        "0000005e",
        "0000005f",
        "00000060",
        "00000061",
        "00000062",
        "00000063",
        "00000064",
        "00000065",
        "00000066",
        "00000067",
        "00000068",
        "00000069",
        "0000006a",
        "0000006b",
        "0000006c",
        "0000006d",
        "0000006e",
        "0000006f",
        "00000070",
        "00000071",
        "00000072",
        "00000073",
        "00000074",
        "00000075",
        "00000076",
        "00000077",
        "00000078",
        "00000079",
        "0000007a",
        "0000007b",
        "0000007c",
        "0000007d",
        "0000007e",
        "0000007f",
        "00000080",
        "00000081",
        "00000082",
        "00000083",
        "00000084",
        "00000085",
        "00000086",
        "00000087",
        "00000088",
        "00000089",
        "0000008a",
        "0000008b",
        "0000008c",
        "0000008d",
        "0000008e",
        "0000008f",
        "00000090",
        "00000091",
        "00000092",
        "00000093",
        "00000094",
        "00000095",
        "00000096",
        "00000097",
        "00000098",
        "00000099",
        "0000009a",
        "0000009b",
        "0000009c",
        "0000009d",
        "0000009e",
        "0000009f",
        "000000a0",
        "000000a1",
        "000000a2",
        "000000a3",
        "000000a4",
        "000000a5",
        "000000a6",
        "000000a7",
        "000000a8",
        "000000a9",
        "000000aa",
        "000000ab",
        "000000ac",
        "000000ad",
        "000000ae",
        "000000af",
        "000000b0",
        "000000b1",
        "000000b2",
        "000000b3",
        "000000b4",
        "000000b5",
        "000000b6",
        "000000b7",
        "000000b8",
        "000000b9",
        "000000ba",
        "000000bb",
        "000000bc",
        "000000bd",
        "000000be",
        "000000bf",
        "000000c0",
        "000000c1",
        "000000c2",
        "000000c3",
        "000000c4",
        "000000c5",
        "000000c6",
        "000000c7",
        "000000c8",
        "000000c9",
        "000000ca",
        "000000cb",
        "000000cc",
        "000000cd",
        "000000ce",
        "000000cf",
        "000000d0",
        "000000d1",
        "000000d2",
        "000000d3",
        "000000d4",
        "000000d5",
        "000000d6",
        "000000d7",
        "000000d8",
        "000000d9",
        "000000da",
        "000000db",
        "000000dc",
        "000000dd",
        "000000de",
        "000000df",
        "000000e0",
        "000000e1",
        "000000e2",
        "000000e3",
        "000000e4",
        "000000e5",
        "000000e6",
        "000000e7",
        "000000e8",
        "000000e9",
        "000000ea",
        "000000eb",
        "000000ec",
        "000000ed",
        "000000ee",
        "000000ef",
        "000000f0",
        "000000f1",
        "000000f2",
        "000000f3",
        "000000f4",
        "000000f5",
        "000000f6",
        "000000f7",
        "000000f8",
        "000000f9",
        "000000fa",
        "000000fb",
        "000000fc",
        "000000fd",
        "000000fe",
        "000000ff"
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

    function test_toHexStr_on_negative_values() {
        Assert.equals("ffffffff", (-1).toHexStr());
        Assert.equals("fffffffe", (-2).toHexStr());
    }

    function test_toHexStr_on_values() {
        for (i => str in HEX_VALUES) Assert.equals(str, i.toHexStr());
    }

    function test_rol() {
        for (i in 0...64) {
            Assert.equals(0, 0.rol(i));
            Assert.equals(1 << (i & 31), 1.rol(i));
            Assert.equals(-1, (-1).rol(i));
            Assert.equals(~(1 << (i & 31)), (-2).rol(i));
        }
    }
}
