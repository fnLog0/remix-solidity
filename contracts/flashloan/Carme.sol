// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import './IBorrower.sol';

contract Carme is ERC20 {
    constructor() ERC20('Carme', 'CAM') {
        _mint(msg.sender, 1000 * 10**decimals());
    }

    function executeFlashloan(uint256 amount) external {
        _mint(msg.sender, amount);
        IBorrower(msg.sender).onExecuteFlashloan(address(this), amount);
        _burn(msg.sender, amount);
    }
}
