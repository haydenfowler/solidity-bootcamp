// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

contract SimpleMappingExample {
    mapping(address => string) myMapping;

    function setValue(address key, string memory value) public {
        myMapping[key] = value;
    }

    function getValue(address key) public view returns (string memory) {
        return myMapping[key];
    }
}
