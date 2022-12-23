// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel14.sol";
import "../src/level14.sol";

contract Attacker is Test {
    GatekeeperTwo level14 = GatekeeperTwo(0x0F5401dbc4d850FbA5273DBDDE6434Fdd58F97Ce);

    function test() external {
        vm.prank(tx.origin);
        new Gatecrasher(address(level14));

        assertEq(level14.entrant(), tx.origin);
    }
}
