pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/Spacehorse.sol";

contract SpacehorseScript is Script {
    function setUp() public {}

    function run() public {
        string memory seedPhrase = vm.readFile(".secret");
        uint256 privateKey = vm.deriveKey(seedPhrase, 0);
        vm.startBroadcast(privateKey);
        Spacehorse spacehorse = new Spacehorse(vm.addr(1));

        vm.stopBroadcast();
    }
}
