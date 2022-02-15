// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

contract MappingStructExample {

    struct Payment {
        uint amount;
        uint timestamp;
    }

    struct Account {
        uint balance;
        uint numPayments;
        mapping(uint => Payment) payments;
    }

    mapping(address => Account) public accounts;
    
    function getBalance(address account) public view returns(uint) {
        return accounts[account].balance;
    }

    function sendMoney() public payable {
        Account storage account = accounts[msg.sender];
        Payment memory payment = Payment(msg.value, block.timestamp);

        account.balance += payment.amount;
        account.payments[account.numPayments] = payment;
        account.numPayments++;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        Account storage account = accounts[msg.sender];
        require(account.balance >= _amount, "Not enough funds");

        account.balance -= _amount;
        _to.transfer(_amount);
    }

    function withdrawAllMoney(address payable _to) public {
        Account storage account = accounts[msg.sender];

        uint balanceToSend = account.balance;
        account.balance = 0;
        _to.transfer(balanceToSend);
    }
}
