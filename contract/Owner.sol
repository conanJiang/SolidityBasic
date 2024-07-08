// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Owner {
    //结构体
    struct Identity {
        address addr;
        string name;
    }

    //枚举
    enum State {
        HasOwner,
        NoOwner
    }

    //事件
    event OwnerSet(address indexed oldOwnerAddr, address indexed newOwnerAddr);
    event OwnerRemoved(address indexed oldOwnerAddr);

    Identity private owner;
    State private state;

    modifier isOwner() {
        require(msg.sender == owner.addr ,"Caller is not owner");
        _;
    }

    constructor(string memory name) {
        owner.addr = msg.sender;
        owner.name = name;
        emit OwnerSet(address(0) , msg.sender);
    }

    function changeOwner(address addr , string calldata name) public isOwner{
        owner.addr = addr;
        owner.name = name;
        emit OwnerSet(msg.sender, addr);
    }

    function removeOwner()public isOwner{
        emit OwnerRemoved(msg.sender);
        delete owner;
        state = State.NoOwner;
    }
    
    function getOwner() external view returns (address,string memory){
        return (owner.addr,owner.name);
    }

    function getState() external view returns (State){
        return state;
    }





}
