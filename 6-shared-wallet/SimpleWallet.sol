// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import "./Allowance.sol";

contract SimpleWallet is Allowance {
    event MoneySent(address indexed _beneficiary, uint256 _amount);
    event MoneyReceived(address indexed _from, uint256 _amount);

    function withdrawMoney(
        address payable _to,
        uint256 _amount
    ) public ownerOrAllowed(_amount) {
        require(
            _amount <= address(this).balance,
            "There are not funds stored in the smart contract !"
        );

        if (!isOwner()) {
            reduceAllowance(msg.sender, _amount);
        }
        _to.transfer(_amount);
        emit MoneySent(_to, _amount);
    }

    function renounceOwnership() public view override onlyOwner {
        revert("Can't renounce ownership here !");
    }

    receive() external payable {
        emit MoneyReceived(msg.sender, msg.value);
    }
}
