// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ExternalContract {
    function mayFailFunction(uint256 value) public pure returns (uint256) {
        require(value > 0, "Value must be greater than zero.");
        return value * 2;
    }
}

contract BasicTryCatchExample{
    ExternalContract externalContract;

    constructor(address _externalContractAddress){
        externalContract = ExternalContract(_externalContractAddress);
    }

    function callExternalFunction(uint256 value) public view returns(uint256){
        try externalContract.mayFailFunction(value) returns (uint256 result){
            return result;
        }catch Error (string memory reason){
            revert(reason);
        
        }
    }
}