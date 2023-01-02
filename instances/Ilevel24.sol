// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

interface PuzzleProxy {
    function admin() external view returns (address);

    function proposeNewAdmin(address) external;

    function approveNewAdmin(address) external;

    function upgradeTo(address) external;
}

interface PuzzleWallet {
    function owner() external view returns (address);

    function whitelisted(address) external view returns (bool);

    function balances(address) external view returns (uint256);

    function setMaxBalance(uint256) external;

    function addToWhitelist(address addr) external;

    function deposit() external payable;

    function execute(address, uint256, bytes calldata) external payable;

    function multicall(bytes[] calldata) external payable;
}
