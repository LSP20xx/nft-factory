// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import "./CustomNFT.sol";

contract NFTFactory is Ownable {
    uint256 public collectionCounter;

    event CollectionCreated(
        address indexed owner,
        address indexed collectionAddress,
        string name,
        string symbol
    );

    constructor() Ownable(msg.sender) {
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
