// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/CustomNFT.sol";

contract DeployCustomNFT is Script {
    function run() external {
        vm.startBroadcast();

        string memory name = "ArtCollective";
        string memory symbol = "ARTC";
        address owner = msg.sender;

        CustomNFT customNFT = new CustomNFT(name, symbol, owner);

        vm.stopBroadcast();
    }
}
