// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../instances/Ilevel18.sol";

contract Attacker is Script {
    MagicNum level18 = MagicNum(0x940aEBc23Fd0D39c8b351bE77a6A368c6C18f52C);

    function run() external {
        bytes memory code = hex"600a600c600039600a6000f3602a60505260206050f3";
        address addr;

        vm.startBroadcast();

        assembly {
            addr := create(0, add(code, 0x20), mload(code))
        }
        level18.setSolver(addr);

        vm.stopBroadcast();
    }
}
