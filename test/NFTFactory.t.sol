// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/NFTFactory.sol";

contract NFTFactoryTest is Test {
    NFTFactory public factory;

    function setUp() public {
        factory = new NFTFactory();
    }

    function testCreateNFTCollection() public {
        address newCollection = factory.createNFTCollection(
            "ArtCollective",
            "ARTC"
        );
        assertTrue(newCollection != address(0));
    }
}
