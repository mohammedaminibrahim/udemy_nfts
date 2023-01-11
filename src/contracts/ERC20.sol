// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract ERC21 {

    // Mapping from token id to the owner
    mapping(uint => address) private = _tokenOwner;

    // Mapping from owner to number of owned tokens
    mapping(address => uint) private = _OwnedTokensAccount;
    
}