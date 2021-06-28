//SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.0;

contract MetaCoin {
    mapping(address => uint256) balances;
    event Transfer(address indexed _from, address indexed _to, uint256 _amount);

    constructor() {
        balances[tx.origin] = 1000;
    }

    function transfer(address recipient, uint256 amount) public returns (bool sufficient) {
        if (balances[msg.sender] < amount) return false;
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function getBalance(address addr) public view returns (uint256) {
        return balances[addr];
    }
}
