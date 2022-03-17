// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./Basicdapptools.sol";

contract BasicdapptoolsTest is DSTest {
    Basicdapptools dapptools;

    function setUp() public {
        dapptools = new Basicdapptools();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
