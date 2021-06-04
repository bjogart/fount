package tests;

import utest.Runner;
import utest.ui.Report;

function main(): Void {
    final runner = new Runner();

    runner.addCase(new TestFloatTools());
    runner.addCase(new TestIntTools());
    runner.addCase(new TestOptionTools());
    runner.addCase(new TestPairTools());
    runner.addCase(new TestQueue());
    runner.addCase(new TestStack());
    runner.addCase(new TestStringTools());

    Report.create(runner);
    runner.run();
}
