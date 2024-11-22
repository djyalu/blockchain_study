// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleEvent{

    event ValueChanged(uint oldValue, uint newValue);

    uint public value;

    function setValue(uint _value) public {
        uint oldValue = value;
        value = _value;
        emit ValueChanged(oldValue, value);
    }
}