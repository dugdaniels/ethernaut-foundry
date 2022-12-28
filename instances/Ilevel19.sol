// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Ownable {
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    function owner() external view returns (address);

    function isOwner() external view returns (bool);

    function renounceOwnership() external;

    function transferOwnership(address newOwner) external;

    function _transferOwnership(address newOwner) external;
}

interface AlienCodex is Ownable {
    function make_contact() external;

    function record(bytes32 _content) external;

    function retract() external;

    function revise(uint256 i, bytes32 _content) external;
}
