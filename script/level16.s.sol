// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../instances/Ilevel16.sol";
import "../src/level16.sol";

contract Attacker is Script {
    Preservation preserve = Preservation(0xe58A5ca9FECb50936e524c4A7c333BE15eB3b744);
    address player = 0xE58EB5D607D62AdDf5F16e3750FB56adD6771917;

    function run() external {
        vm.broadcast();
        new TimeZoneAttack(address(preserve), player);
    }
}
