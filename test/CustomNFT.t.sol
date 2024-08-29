// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/CustomNFT.sol";

contract CustomNFTTest is Test {
    CustomNFT public customNFT;
    address public testAddress = address(0x1234);

    function setUp() public {
        customNFT = new CustomNFT("ArtCollective", "ARTC", address(this));
    }

    function testMintNFT() public {
        uint256 tokenId = customNFT.mintNFT(
            testAddress,
            "https://example.com/token"
        );
        assertEq(tokenId, 0);
        assertEq(customNFT.tokenURI(0), "https://example.com/token");
    }
}
