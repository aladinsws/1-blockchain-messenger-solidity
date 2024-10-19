// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SampleContract {
    uint public myUint = 123;

    function setMyUint(uint _newUint) public payable {
        myUint = _newUint;
    }
}
