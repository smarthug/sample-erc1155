// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ERC1155} from "@openzeppelin/contracts@5.2.0/token/ERC1155/ERC1155.sol";
import {Ownable} from "@openzeppelin/contracts@5.2.0/access/Ownable.sol";

contract MyToken is ERC1155, Ownable {
    constructor(address initialOwner) ERC1155("https://example.com/metadata/{id}.json") Ownable(initialOwner) {
        _mint(msg.sender, 0, 10000, "");
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }



}
