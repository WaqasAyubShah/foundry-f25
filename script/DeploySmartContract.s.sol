// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import {Script} from "forge-std/Script.sol";
import {Storage} from "../src/Storage.sol";

contract DeploySmartContract is Script {
    function run() external returns(Storage) {
        vm.startBroadcast();
        Storage myStorage = new Storage();
        vm.stopBroadcast();
        return myStorage;
    }
}