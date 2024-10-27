// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Allowance is Ownable {
    event AllowanceChanged(
        address indexed _to,
        address indexed _from,
        uint256 _oldAmount,
        uint256 _newAmount
    );

    mapping(address => uint256) public allowance;

    modifier ownerOrAllowed(uint256 _amount) {
        require(
            isOwner() || allowance[msg.sender] >= _amount,
            "You are not allowed !"
        );
        _;
    }

    constructor() Ownable(msg.sender) {}

    function isOwner() public view returns (bool) {
        return owner() == msg.sender;
    }

    function addAllowance(address _to, uint256 _amount) public onlyOwner {
        emit AllowanceChanged(_to, msg.sender, allowance[_to], _amount);
        allowance[_to] = _amount;
    }

    function reduceAllowance(address _to, uint256 _amount) internal {
        emit AllowanceChanged(
            _to,
            msg.sender,
            allowance[_to],
            SafeMath.sub(allowance[_to], _amount)
        );
        allowance[_to] = SafeMath.sub(allowance[_to], _amount);
    }
}
