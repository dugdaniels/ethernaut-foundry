// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Destructor {
    event Boom();

    function destroy() external {
        emit Boom();
        selfdestruct(payable(address(0)));
    }
}
