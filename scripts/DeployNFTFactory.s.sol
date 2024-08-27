// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/NFTFactory.sol";

contract DeployNFTFactory is Script {
    function run() external {
        vm.startBroadcast();
        NFTFactory factory = new NFTFactory();
        vm.stopBroadcast();
    }
}
