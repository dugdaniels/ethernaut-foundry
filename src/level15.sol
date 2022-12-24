// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel15.sol";

contract NaughtBank {
    NaughtCoin private immutable token;

    constructor(NaughtCoin _token) {
        token = _token;
    }

    function withdraw(uint256 amount) external {
        token.transferFrom(msg.sender, address(this), amount);
    }
}
