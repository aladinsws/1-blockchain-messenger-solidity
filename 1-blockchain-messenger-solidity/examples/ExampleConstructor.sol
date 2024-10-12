// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleContructor {
    address public myAddresse;

    constructor(address _someAddresse) {
        myAddresse = _someAddresse;
    }

    function setMyAddresse(address _myAddresse) public {
        myAddresse = _myAddresse;
    }

    function setMyAddresseToMsgSender() public {
        myAddresse = msg.sender;
    }
}
