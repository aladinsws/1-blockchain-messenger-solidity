// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleWrapArround {
    uint256 public myUint; // from 0 -> (2^256)-1

    uint8 public myUint8 = 2 ** 4;

    function setMyUint(uint256 _myUint) public {
        myUint = _myUint;
    }

    function decretmentUInt() public {
        unchecked {
            myUint--;
        }
    }

    function incretmentUint8() public {
        myUint8++;
    }
}
