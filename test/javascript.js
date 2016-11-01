/* eslint-disable */
const assert = require("assert");
const process = require("child_process");

describe("JavaScript", () => {
  const exec = testCase => process.execFileSync("./a.out", [ "test/lang/js/"+ testCase +".js" ], { encoding: "utf8" });

  it("function with no arguments", () => {
    const out = exec("test1");

    const expected = "## function foo" + "\n\n\n\n\n\n";

    assert.equal(out, expected);
  })

  it("function with one argument", () => {
    const out = exec("test2");

    const expected = `## function foo

### Parameters

| name |
|------|
| a |
` + "\n\n\n\n";

    assert.equal(out, expected);
  })

  it("function with multiple arguments", () => {
    const out = exec("test3");

    const expected = `## function foo

### Parameters

| name |
|------|
| b |
| a |
` + "\n\n\n\n";

    assert.equal(out, expected);
  })
});
