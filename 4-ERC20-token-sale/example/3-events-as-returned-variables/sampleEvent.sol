// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract EventContract {
    mapping(address => uint) public tokenBalance;

    event TokensSent(address indexed _from, address indexed _to, uint _amount);

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint _amount) public returns (bool) {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens !");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;

        emit TokensSent(msg.sender, _to, _amount);

        return true;
    }

    // To keep track of contract events, go to this link: https://jsfiddle.net/zkynau6x/12/
}