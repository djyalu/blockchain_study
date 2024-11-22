// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract RevertExample {
    uint256 public balance;

    function deposit(uint256 amount) public{
        if (amount <= 0){
            revert("Deposit amount must be greater than zero");
        }
        balance += amount;
    }

    function withdraw(uint256 amount) public{
        if (amount > balance){
            revert("Insufficient balance");
        }
        balance -= amount;
    }
}