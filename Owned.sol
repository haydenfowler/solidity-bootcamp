// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

contract Owned {
    address owner;

    constructor()  {
        owner = msg.sender;
    }

    // Functions that make use of modifiers have their entire function contents copied in place of this underscore at time of compilation.
    // Logic can then be executed before and / or after the consuming function is invoked.
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not allowed");
        _;
    }
}
