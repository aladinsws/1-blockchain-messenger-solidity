// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleUint {
    uint256 public myUint; // from 0 -> (2^256)-1

    uint8 public myUint8 = 250; // from 0 -> (2^8)-1

    int public myInt = -10; // from -2^128 -> (2^128)-1

    function setMyUint(uint256 _myUint) public {
        myUint = _myUint;
    }

    function incretmentUint8() public {
        myUint8++;
    }

    function incretmentUInt() public {
        myInt++;
    }

    function decretmentUInt() public {
        myInt--;
    }
}
