// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./Basicdapptools.sol";

contract BasicdapptoolsTest is DSTest {
    Basicdapptools dapptools;

    function setUp() public {
        dapptools = new Basicdapptools();
    }

    function test_add_true() public {
        assertTrue(dapptools.add(1,3) ==4);
    }

    // detail log of an comparison
    // eg
   // ├╴log("Error: a == b not satisfied [uint]") (lib/ds-test/src/test.sol:124)
    //  ├╴log_named_uint("  Expected", 4) (lib/ds-test/src/test.sol:125)
   //   └╴log_named_uint("    Actual", 3) (lib/ds-test/src/test.sol:126)

    function test_add_numbers() public {
        assertEq(dapptools.add(1, 3), 4);
    }

    // Fail after the test word will invert check the test: this function should fail
    function testFail_noFunAdd() public {
        assertEq(dapptools.noFunAdd(0, 69),69);
    }

    // fuzz testings

    function testFuzzingAddNumbers(uint128 a, uint128 b) public {
        assertEq(dapptools.add(a, b),uint256(a)+uint256(b));
    }

    //symbolic testings

    function proveSymbolicAddNumbers(uint128 a, uint128 b) public {
        assertEq(dapptools.add(a, b),uint256(a) + uint256(b));
    }

    // invariant testings
    // invariant test will run all the function ramdonly in the contract then checks its value

    // function invariantIncreaseTest() public {
    //     emit log_uint(dapptools.value());
    //     assertEq(dapptools.value() * 2 , dapptools.valueTimesTwo());
    // }

    // log_uint only appears if you test cases fails by default
    // but verbosity 2 will also log the messages if your test get successful
}


// ---------------------------------------------------------------- commands

// dapp test ==> for running the test cases
// dapp test --verbosity 3 => for running the test cases along with stack traces