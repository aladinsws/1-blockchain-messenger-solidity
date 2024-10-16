// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ContractOne {
    mapping(address => uint256) public addressBalances;

    function deposit() public payable {
        addressBalances[msg.sender] += msg.value;
    }

    receive() external payable {
        deposit();
    }
}

contract ContractTwo {
    receive() external payable {}

    function depositeOnContactOne(address _contarctOne) public {
        //ContractOne one = ContractOne(_contarctOne);
        //one.deposit{value: 10, gas: 100000}();

        //bytes memory payload = abi.encodeWithSignature("deposit()");
        //(bool success, ) = _contarctOne.call{value: 10, gas: 100000}(payload);

        (bool success, ) = _contarctOne.call{value: 10, gas: 100000}("");

        require(success);
    }
}
