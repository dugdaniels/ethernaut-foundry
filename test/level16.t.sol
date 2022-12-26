// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel16.sol";
import "../src/level16.sol";

contract Attacker is Test {
    Preservation preserve = Preservation(0xe58A5ca9FECb50936e524c4A7c333BE15eB3b744);
    address player = 0xE58EB5D607D62AdDf5F16e3750FB56adD6771917;

    function test() external {
        new TimeZoneAttack(address(preserve), player);

        assertEq(preserve.owner(), player);
    }
}
