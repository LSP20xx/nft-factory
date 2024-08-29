// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract CustomNFT is ERC721, Ownable {
    uint256 public tokenCounter;
    mapping(uint256 => string) private _tokenURIs;

    constructor(
        string memory name,
        string memory symbol,
        address owner
    ) ERC721(name, symbol) Ownable(owner) {
        tokenCounter = 0;
    }

    function mintNFT(
        address recipient,
        string memory uri
    ) public onlyOwner returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(recipient, newTokenId);
        _setTokenURI(newTokenId, uri);
        tokenCounter++;
        return newTokenId;
    }

    function _setTokenURI(uint256 tokenId, string memory uri) internal {
        _tokenURIs[tokenId] = uri;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        require(
            ownerOf(tokenId) != address(0),
            "ERC721Metadata: URI query for nonexistent token"
        );
        return _tokenURIs[tokenId];
    }
}
