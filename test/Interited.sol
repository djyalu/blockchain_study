// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Owned{
    address public owner;

    constructor(){
        owner = msg.sender;

    }

    modifier onlyOwner(){
        require(msg.sender == owner, "not an owner");
        _;
    }
}

contract Inherited is Owned{
    uint public value;

    function setValue(uint _value) public onlyOwner{
        value = _value;
    }
}