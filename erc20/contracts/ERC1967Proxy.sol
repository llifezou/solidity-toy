// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Proxy1967 is ERC1967Proxy, Ownable {
    constructor(address _logic, bytes memory _data) payable ERC1967Proxy(_logic, _data){}

    function implementation() public view returns (address impl) {
        return _implementation();
    }

    function upgradeTo(address newImplementation) public onlyOwner {
        return _upgradeTo(newImplementation);
    }

    function upgradeToAndCall(
        address newImplementation,
        bytes memory data,
        bool forceCall
    ) public onlyOwner {
        return _upgradeToAndCall(newImplementation, data, forceCall);
    }
}