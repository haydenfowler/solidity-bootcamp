// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

contract ExceptionExample {
    mapping(address => uint64) public balanceReceived;

    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + uint64(msg.value) >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += uint64(msg.value);
    }

    function withdrawMoney(address payable _to, uint64 _amount) public {
        // returns remaining gas. use for user validation. let's you return an error string.
        // Revert can be used in a very similar way & is functionally the same, e.g:
        //   if (_amount <= balanceReceived[msg.sender]) { revert("You do not have enough ether"); };
        require(_amount <= balanceReceived[msg.sender], "You do not have enough ether");
        // consumes all gas. should be used for checking internal state and NOT user input; more for unexpected use cases.
        // Cannot return an error string. May be thrown for internal issues (e.g divide by zero).
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);

        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}
