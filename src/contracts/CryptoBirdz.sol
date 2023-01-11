// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//inmport ERC721 Connector
import './ERC721Connector.sol';

contract CryptoBirdz is ERC721Connector{
    

    constructor() ERC721Connector('CryptoBirdz', 'CRBZ') {
        
    }
        
}