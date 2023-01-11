// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//inmport ERC721 Connector
import './ERC721Connector.sol';

contract CryptoBirdz is ERC721Connector{
    

    // array to store crypto birds when they mint
    string [] public cryptoBirds;

    mapping(string => bool) _cryptoBirdsExist;

    function mint(string memory _CryptoBird) {

        require(!_cryptoBirdsExist[_CryptoBird],
        'Error - Crypto Already Exsit');

       // deprecated uint _id = CryptoBirds.push($_CryptoBird);
       uint _id = cryptoBirds.push(_CryptoBird);
       uint _id = cryptoBirds.length - 1;

        _mint(msg.sender, _id);

        _cryptoBirdsExist[_CryptoBird] = true;
    }

    constructor() ERC721Connector('CryptoBirdz', 'CRBZ') {
        
    }
        
}