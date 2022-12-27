// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel18.sol";

contract Attacker is Test {
    MagicNum level18 = MagicNum(0x940aEBc23Fd0D39c8b351bE77a6A368c6C18f52C);

    function test() external {
        bytes memory code = hex"600a600c600039600a6000f3602a60505260206050f3";
        address addr;

        assembly {
            addr := create(0, add(code, 0x20), mload(code))
        }

        level18.setSolver(addr);

        assertEq(level18.solver(), addr);
    }
}
