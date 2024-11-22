// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleBank {
    mapping(address => uint256) private balances;

    event Deposit(address indexed account, uint256 amount);
    event Withdrawal(address indexed account, uint256 amount);

    // 사용자가 자신의 계좌에 입금하는 함수 (입금 금액을 인자로 받음)
    function deposit(uint256 amount) public payable {
        require(amount > 0, unicode"입금 금액은 0보다 커야 합니다.");
        require(msg.value == amount, unicode"입력한 금액과 전송된 이더가 일치해야 합니다.");
        balances[msg.sender] += amount;
        emit Deposit(msg.sender, amount);
    }

    // 사용자가 자신의 계좌에서 인출하는 함수
    function withdraw(uint256 amount) public {
        require(amount > 0, unicode"인출 금액은 0보다 커야 합니다.");
        require(balances[msg.sender] >= amount, unicode"잔액이 부족합니다.");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }

    // 사용자가 자신의 계좌 잔액을 조회하는 함수
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}

