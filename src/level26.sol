// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {IDetectionBot, IForta} from "../instances/Ilevel26.sol";

contract Bot is IDetectionBot {
    address private vault;

    constructor(address _vault) {
        vault = _vault;
    }

    function handleTransaction(address user, bytes calldata msgData) external override {
        (,, address origSender) = abi.decode(msgData[4:], (address, uint256, address));

        if (origSender == vault) {
            IForta(msg.sender).raiseAlert(user);
        }
    }
}
