// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "./ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Toy is ERC20, Ownable {
    using SafeMath for uint256;

    function initialize(string memory name_, string memory symbol_, uint256 maxTotalSupply_) public {
        _initialize(name_, symbol_, maxTotalSupply_);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "TOY: no mint to zero address");
        require(maxTotalSupply >= totalSupply().add(amount), "TOY: Don't go over MAX");

        _mint(to, amount);
    }
}