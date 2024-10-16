// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Sender {
    receive() external payable {}

    function withdrawTransfer(address payable _to) public {
        _to.transfer(10);
    }

    function withdrawSend(address payable _to) public {
        bool isSent = _to.send(10);

        require(isSent, "Sending the funds was failed");
    }
}

contract ReceiverNoAction {
    function balance() public view returns (uint256) {
        return address(this).balance;
    }

    receive() external payable {}
}

contract ReceiverAction {
    uint256 public balanceReceived;

    function balance() public view returns (uint256) {
        return address(this).balance;
    }

    receive() external payable {
        balanceReceived += msg.value;
    }
}
