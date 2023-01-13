// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {GatekeeperThree} from "../instances/Ilevel28.sol";
import {GateCrasher} from "../src/level28.sol";

contract Attacker is Test {
    GatekeeperThree gate = GatekeeperThree(payable(0x3AD09b3fE01754d07B09b3df57f123766dF1cFf8));
    address player = 0xE58EB5D607D62AdDf5F16e3750FB56adD6771917;

    function test() external {
        vm.startPrank(player, player);
        GateCrasher crasher = new GateCrasher{value: 0.0011 ether}(address(gate));
        crasher.enter();

        assertEq(gate.entrant(), player);
    }
}
