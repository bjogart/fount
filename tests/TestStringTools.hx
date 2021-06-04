package tests;

import utest.Assert;
import utest.ITest;

using fount.Core;

class TestStringTools implements ITest {
    public function new() {}

    function test_repeating_the_empty_string_returns_the_empty_string() {
        Assert.equals("", "".repeat(3));
    }

    function test_0_repeats_returns_the_empty_string() {
        Assert.equals("", "Hello, World!".repeat(0));
    }

    function test_2_repeats_returns_a_string_concatenated_with_itself() {
        Assert.equals("Hello, World!Hello, World!", "Hello, World!".repeat(2));
    }

    function test_empty_reverse_is_empty() {
        Assert.equals("", "".reverse());
    }

    function test_reverse_reverses_string() {
        Assert.equals("dlroW ,olleH", "Hello, World".reverse());
    }

    function test_escape_handles_all_cases() {
        final str = 'This\tstring\r\ncontains_a variety\\of "escaped" characters.';
        Assert.equals('This\\tstring\\r\\ncontains_a variety\\\\of \\"escaped\\" characters.', str.escape());
    }
}
