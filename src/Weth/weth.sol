// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;


import {ERC20} from "solmate.git/tokens/ERC20.sol";
import {SafeTransferLib} from "solmate.git/utils/SafeTransferLib.sol";

contract Weth is ERC20("Wrapped Ether","Weth",18) {
    using SafeTransferLib for address;

    event Deposit(address indexed from, uint256 amount);

    event Withdrawal(address indexed to, uint256 amount);


    function deposit() public payable {
        _mint(msg.sender,msg.value);
        emit Deposit(msg.sender,msg.value);
    }

    function withdraw(uint amount) external {
        _burn(msg.sender, amount);

        msg.sender.safeTransferETH(amount);

        emit Withdrawal(msg.sender, amount);
    }

    receive() external payable {
        deposit();
    }

}