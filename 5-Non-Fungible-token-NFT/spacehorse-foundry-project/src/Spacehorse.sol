// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

import "@openzeppelin/contracts/utils/Strings.sol";

contract Spacehorse is ERC721, Ownable {
    uint256 private _nextTokenId;

    constructor(address initialOwner)
        ERC721("Spacehorse", "SHR")
        Ownable(initialOwner)
    {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://raw.githubusercontent.com/aladinsws/ethereum-blockchain-labs/refs/heads/main/5-Non-Fungible-token-NFT/";
    }

    function buyToken() public payable {
        uint256 tokenId = _nextTokenId;
        require(msg.value== tokenId * 0.1 ether , "Wrong amount of funds sent !");

        _nextTokenId++;
        _safeMint(msg.sender, tokenId);
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId)
        public
        pure
        override(ERC721)
        returns (string memory)
    {
        return string(abi.encodePacked(_baseURI(),"spacehorse_",Strings.toString(tokenId+1),".json"));
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}