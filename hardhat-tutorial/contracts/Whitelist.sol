//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.9;

contract WhiteList {
    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;
    
    // numbers of how many addresses are in whitelist
    uint8 public numAddressesWhitelisted;

    // check if an address is in whitelist
    mapping(address => bool) public whitelistedAddresses;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    // adds the address of the sender to the whitelist
    function addAddressToWhitelist() public {
        // check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "sender has already been whitelisted");

        // check if the numAddressesWhitelisted < maxWhitelistedAddresses, 
        //if not then throw an error.
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "more addresses can't be added!");

        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }




}