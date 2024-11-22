// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract PureStringExample {
    function concatenate(string memory a, string memory b) public pure returns(string memory){
        return string(abi.encodePacked(a,b));
    }
}