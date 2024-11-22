// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ValueCheck{
    modifier validValue(uint _value){
        require(_value <= 100, "value must be less than or equal to 100");
        _;
    }
}

contract ValueContract is ValueCheck{
    uint public value;

    function setValue(uint _value) public validValue(_value){
        value = _value;
    }
}