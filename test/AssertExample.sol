// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract AssertExample {
    uint256 public balance;

    function deposit(uint256 amount) public{
        assert(amount > 0, "Deposit amount must be greater than zero");
        balance += amount;
    }

    function withdraw(uint256 amount) public{
        require(balance >= amount, "Insufficient balance");
        balance -= amount;
    }
}