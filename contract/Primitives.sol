// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Primitives{
    bool public boo = true;

    uint8 public u8 =1;
    uint256 public u256 = 456;
    uint256 public u =123;

    int256 public i8 =-1;
    int256 public i256 =456;
    int256 public i = -123;

    int256 public minInt = type(int256).min;
    int256 public maxInt = type(int256).max;

    bytes1 a = 0xb5;
    bytes1 b = 0xb6;

    bool public defaultBoo;
    uint256 public defaultUint;
    int256 public defaultInt;
    address public defaultAddr;


    

}