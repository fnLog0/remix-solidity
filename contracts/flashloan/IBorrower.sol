// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IBorrower {
    function startFlashloan(address token, uint256 amount) external;

    function onExecuteFlashloan(address token, uint256 amount) external;
}
