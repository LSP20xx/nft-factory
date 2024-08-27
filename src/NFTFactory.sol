// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract NFTFactory is Ownable {
    uint256 public collectionCounter;

    event CollectionCreated(
        address indexed owner,
        address indexed collectionAddress,
        string name,
        string symbol
    );

    constructor() {
        collectionCounter = 0;
    }

    function createNFTCollection(
        string memory name,
        string memory symbol
    ) public onlyOwner returns (address) {
        CustomNFT newCollection = new CustomNFT(name, symbol, msg.sender);
        emit CollectionCreated(
            msg.sender,
            address(newCollection),
            name,
            symbol
        );
        collectionCounter++;
        return address(newCollection);
    }
}
