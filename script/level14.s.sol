// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../instances/Ilevel14.sol";
import "../src/level14.sol";

contract Attacker is Script {
    GatekeeperTwo level14 = GatekeeperTwo(0x0F5401dbc4d850FbA5273DBDDE6434Fdd58F97Ce);

    function run() external {
        vm.broadcast();
        new Gatecrasher(address(level14));
    }
}
