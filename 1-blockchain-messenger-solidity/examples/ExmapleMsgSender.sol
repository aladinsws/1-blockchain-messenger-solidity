// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleMsgSender {
    address public someAddresse;

    function updateSomeAddresse() public {
        someAddresse = msg.sender;
    }
}
