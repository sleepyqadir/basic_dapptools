// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

contract Basicdapptools {

    uint256 public value = 1;
    uint256 public valueTimesTwo = 2;

    function add(uint256 a, uint256 b) external pure returns(uint256) {
        return a + b;
    }

    function noFunAdd(uint256 a, uint256 b) external pure returns(uint256) {
        uint256 result = a + b;
        require(result != 69 && result != 420,"No fun to numbers");
        return result;
    }

    function increase() public {
        value++;
        valueTimesTwo*=2;
    }
}
