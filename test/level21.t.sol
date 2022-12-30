// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {Shop} from "../instances/Ilevel21.sol";
import {Thief} from "../src/level21.sol";

contract Attacker is Test {
    Shop level21 = Shop(0x8985Edec501b17f9F50aDf8F21558Ca096a35730);

    function test() external {
        Thief thief = new Thief(level21);
        thief.steal();

        assert(level21.isSold());
        assert(level21.price() < 200);
    }
}
