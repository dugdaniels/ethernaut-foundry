// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "../instances/Ilevel00.sol";
import "forge-std/Test.sol";

contract Attacker is Test {
    Instance level00 = Instance(0xD6936877fC8a33befD4f2A5aaEFBC7e4Ddd83836);

    function test() external {
        vm.startBroadcast();

        level00.password();
        level00.authenticate(level00.password());

        vm.stopBroadcast();
    }
}
