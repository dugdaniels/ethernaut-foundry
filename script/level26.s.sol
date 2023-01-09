// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {DoubleEntryPoint, CryptoVault, LegacyToken} from "../instances/Ilevel26.sol";
import {Bot} from "../src/level26.sol";
import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract Attacker is Script {
    DoubleEntryPoint level26 = DoubleEntryPoint(0xFA1c67fbB6fe2C4b0383ea3D130Ec2E12DA0d9af);
    CryptoVault vault = CryptoVault(level26.cryptoVault());
    LegacyToken legacyToken = LegacyToken(level26.delegatedFrom());

    function run() external {
        vm.startBroadcast();

        Bot detectionBot = new Bot(address(vault));
        level26.forta().setDetectionBot(address(detectionBot));

        vm.stopBroadcast();
    }
}
