// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel13.sol";
import "../src/level13.sol";

contract Attacker is Test {
    GatekeeperOne level13 = GatekeeperOne(0x068Bf4ecb199d5b28c50Ad74a8152EB0C640626E);

    function test() external {
        Gatecrasher gatecrasher = new Gatecrasher(address(level13));

        vm.prank(tx.origin);
        gatecrasher.crash();

        assertEq(level13.entrant(), tx.origin);
    }
}
