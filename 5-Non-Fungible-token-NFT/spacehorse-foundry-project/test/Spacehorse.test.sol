pragma solidity ^0.8.4;

import "forge-std/Test.sol"; // Import Foundry's Test base contract
import "../src/Spacehorse.sol"; // Import your contract to test
import "forge-std/console.sol";

contract SpacehorseTest is Test {
    Spacehorse spacehorse;

    function setUp() public {
        address initialOwner = vm.addr(1);
        spacehorse = new Spacehorse(initialOwner);
    }

    function testNameIsSpacehorse() public view {
        assertEq(spacehorse.name(), "Spacehorse");
    }

    function testMintingNFTs() public {
        address owner = address(vm.addr(1));
        vm.startPrank(owner);

        spacehorse.safeMint(owner);
        assertEq(spacehorse.ownerOf(0), owner);
        assertEq(
            spacehorse.tokenURI(0),
            "https://raw.githubusercontent.com/aladinsws/ethereum-blockchain-labs/refs/heads/main/5-Non-Fungible-token-NFT/spacehorse_1.json"
        );
        vm.stopPrank();
    }

    function testNFTcreationWrongOwner() public {
        address purchaser = address(0x1);
        vm.startPrank(purchaser);
        vm.expectRevert();
        spacehorse.safeMint(purchaser);
        vm.stopPrank();
    }

    function testNFTBuyToken() public {
        address purchaser = address(0x2);
        vm.startPrank(purchaser);
        spacehorse.buyToken();
        vm.stopPrank();
        assertEq(spacehorse.ownerOf(0), purchaser);
    }
}
