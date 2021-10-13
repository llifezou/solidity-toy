// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

contract contract1 {

    uint public data;
    address public owner;

    function setOwner(address _owner) public {
        owner = _owner;
    }

    function setData(uint _data) public {
        require(msg.sender == owner, "must owner");
        data = _data;
    }
}

contract contract2 {
    function toSetData(contract1 c1, uint _data) public {
        c1.setData(_data);
    }
}
