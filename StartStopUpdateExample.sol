// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

contract StartStopUpdateExample {
    address owner;
    bool public isPaused;

    constructor() {
        owner = msg.sender;
    }

    function sendMoney() public payable {

    }

    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner, "Only the owner can interact with this function");
        require(!isPaused, "The contract is paused");
        _to.transfer(address(this).balance);
    }

    function toggleIsPaused(bool _paused) public {
        require(msg.sender == owner, "Only the owner can interact with this function");
        isPaused = _paused;
    }

    function destroySmartContract() public {
        require(msg.sender == owner, "Only the owner can interact with this function");
        selfdestruct(payable(msg.sender));
    }
}
