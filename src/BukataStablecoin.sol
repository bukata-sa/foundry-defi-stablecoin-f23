// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import {ERC20, ERC20Burnable} from "@openzeppelin/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/access/Ownable.sol";

contract BukataStablecoin is ERC20Burnable, Ownable {
    constructor() ERC20("Stable Bukata USD", "sBKT") Ownable(msg.sender) {}

    function burn(uint256 amount) public override onlyOwner {
        require(amount > 0, "burn amount should be positive");
        require(balanceOf(msg.sender) >= amount, "balanceOf sender should be greater or equal than burn amount");
        super.burn(amount);
    }

    function mint(address _to, uint256 amount) public onlyOwner {
        require(amount > 0, "mint amount should be positive");
        require(_to != address(0), "can't mint to zero address");
        _mint(_to, amount);
    }
}
