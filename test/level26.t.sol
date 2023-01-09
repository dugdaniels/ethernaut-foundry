// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {DoubleEntryPoint, CryptoVault, LegacyToken} from "../instances/Ilevel26.sol";
import {Bot} from "../src/level26.sol";
import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract Attacker is Test {
    DoubleEntryPoint level26 = DoubleEntryPoint(0xFA1c67fbB6fe2C4b0383ea3D130Ec2E12DA0d9af);
    CryptoVault vault = CryptoVault(level26.cryptoVault());
    LegacyToken legacyToken = LegacyToken(level26.delegatedFrom());

    function test() external {
        Bot detectionBot = new Bot(address(vault));
        level26.forta().setDetectionBot(address(detectionBot));

        uint256 originalBalance = LegacyToken(legacyToken).balanceOf(address(vault));
        vault.sweepToken(IERC20(level26.delegatedFrom()));
        uint256 balance = LegacyToken(legacyToken).balanceOf(address(vault));

        assertEq(originalBalance, balance);
    }
}
