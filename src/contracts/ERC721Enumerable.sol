// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import './ERC721.sol';


contract ERC721Enumerable is ERC721  {

    uint256[] private _allTokens;

    // mapping from tokenid to position in _alltokens array
    mapping(uint256 => uint256) private _allTokensIdex;

    // mapping from owner list of all tokens ids
    mapping(address => uint256[]) private _ownedTokens;

    //mapping from token id index of the owner token list
    mapping(uint256 => uint256) private _ownedTokensIndex;

    // @notice Count NFTs tracked by this contract
    // @return A count of valid NFTs tracked by this contract, where each one of
    /// them has an assigned and queryable owner not equal to the zero address
    

    // @notice Enumerate valid NFTs
    // @dev Throws if `_index` >= `totalSupply()`.
    // @param _index A counter less than `totalSupply()`
    // @return The token identifier for the `_index`th NFT,
    //  (sort order not specified)
   // function tokenByIndex(uint256 _index) external view returns (uint256);

    // @notice Enumerate NFTs assigned to an owner
    // @dev Throws if `_index` >= `balanceOf(_owner)` or if
    //  `_owner` is the zero address, representing invalid NFTs.
    // @param _owner An address where we are interested in NFTs owned by them
    // @param _index A counter less than `balanceOf(_owner)`
    // @return The token identifier for the `_index`th NFT assigned to `_owner`,
    //   (sort order not specified)
    //function tokenOfOwnerByIndex(address _owner, uint256 _index) external view returns (uint256);

   

    function _addTokensToTotalSupply(uint256 tokenId) private {

        _allTokens.push(tokenId);
    }

    function _mint(address to, uint256 tokenId) internal override(ERC721) {
        super._mint(to, tokenId);

        // _addTokensToTotalSupply(tokenId);
        _addTokensToAllTokenEnumeration(tokenId);
        _addTokensToOwnerEnumerations(to, tokenId);
    } 

    function _addTokensToAllTokenEnumeration(uint256 tokenId) private{
         _allTokens[tokenId] = _allTokens.length;
         _allTokens.push(tokenId);
    }

    function tokenByIndex(uint256 index) public view returns(uint256){
        require(index < totalSupply(), 'Global index is out of bound');
        return _allTokens[index];
    }

    function tokenOfOwnerByIndex(address owner, uint index ) public view returns(uint256) {
        require(index < balanceOf(owner), 'Global index is out of bound');
        return _ownedTokens[owner][index];
    }


    function _addTokensToOwnerEnumerations(address to, uint256 tokenId) private {
        // add address and Ids to user own tokens
        _ownedTokensIndex[tokenId] = _ownedTokens[to].length;
        _ownedTokens[to].push(tokenId);
    }

    function totalSupply() public view returns(uint256){
        return _allTokens.length;
    }


}
