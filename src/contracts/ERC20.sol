// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract ERC21 {

    // Mapping from token id to the owner
    mapping(uint => address) private = _tokenOwner;

    // Mapping from owner to number of owned tokens
    mapping(address => uint) private = _OwnedTokensAccount;


    function _mint(address to, uint256 tokenId) internal {
        //check for invalid address
        require(to != address(0), 'ERC721: minting to the zero address');
        _tokenOwner[tokenId] = to;
        _OwnedTokensAccount[to] += 1; // _OwnedTokensAccount[to] = _OwnedTokensAccount[0] + 2

    }
}