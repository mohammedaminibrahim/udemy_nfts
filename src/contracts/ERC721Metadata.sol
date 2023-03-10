// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract ERC721Metadata {
    string private _name;
    string private _symbol;

    constructor(string memory named, string memory symbolified){
        _name = named;
        _symbol = symbolified;
    }

    function name() view external returns(string memory) {
        return _name;
    }

    function symbol() view external returns(string memory){
        return _symbol;
    }
}