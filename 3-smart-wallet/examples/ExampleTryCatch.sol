// SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract WillThrow {
    error NotAllowedError(string reason);

    function aFunction() public pure {
        //require(false,"error message");
        //assert(false);
        revert NotAllowedError("You are not allowed");
    }
}

contract ErrorHandling {
    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorLogBytes(bytes lowerLevelData);

    function catchTheError() public {
        WillThrow will = new WillThrow();
        try will.aFunction() {
            // add code here if it works
        } catch Error(string memory reason) {
            // handle require
            emit ErrorLogging(reason);
        } catch Panic(uint errorCode) {
            // handle assert
            emit ErrorLogCode(errorCode);
        } catch (bytes memory lowerLevelData) {
            // handle custom error
            emit ErrorLogBytes(lowerLevelData);
        }
    }
}
