// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract ERC721 {

    event Transfer(
        address indexed from, 
        address indexed to,
        uint256 indexed tokenId
    );

    // Mapping from token id to the owner
    mapping(uint => address) private _tokenOwner;

    // Mapping from owner to number of owned tokens
    mapping(address => uint) private _OwnedTokensAccount;

    // Information derived from ERC71 page
    // @notice Count all NFTs assigned to an owner
    // @dev NFTs assigned to the zero address are considered invalid, and this
    //  function throws for queries about the zero address.
    // @param _owner An address for whom to query the balance
    // @return The number of NFTs owned by `_owner`, possibly zero
    function balanceOf(address owner) public view returns(uint256){

        require(owner != address(0), 'owner token address non-existence');
        return _OwnedTokensAccount[owner];
    }

    // Information derived from ERC71 page
    // @notice Find the owner of an NFT
    // @dev NFTs assigned to zero address are considered invalid, and queries
    //  about them do throw.
    // @param _tokenId The identifier for an NFT
    // @return The address of the owner of the NFT
    function ownerOf(uint256 _tokenId) external view returns (address){
         address owner = _tokenOwner[_tokenId];
        require(owner != address(0), 'owner token address non-existence');
        return owner;
    }

    // check if token id exist and it truthfulness
    function _exist(uint256 tokenId) internal view returns(bool){
        // set the address of nft to check the token owner
        address owner = _tokenOwner[tokenId];
        // return the truthfullness of the address at the token if
        return owner != address(0);
    }


    function _mint(address to, uint256 tokenId) internal {
        //check for invalid address
        require(to != address(0), 'ERC721: minting to the zero address');
        // check if token does not exist
        require(!_exist(tokenId), 'ERC721: Already minted');
        // adding new address with token id exist
        _tokenOwner[tokenId] = to;
        // keep track of each address that is minting and adding 1 to it
        _OwnedTokensAccount[to] += 1; // _OwnedTokensAccount[to] = _OwnedTokensAccount[0] + 2

        // emit the Transfer EVent
        emit Transfer(address(0), to, tokenId);
    }
}