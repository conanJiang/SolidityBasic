// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ErrorTest {
    function testRequire(uint256 _i) public pure{
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint256 _i) public pure{
        if(_i > 10){
            revert("Input must be greater than 10");
        }
    }

    uint256 private num;

    function testAssert() public view {
        assert(num == 0);
    }

    //自定义错误
    error InsufficientBalance(uint256 balance,uint256 withdrawAmount);

    function testCustomerErr(uint256 _withdrawAmount) public view{
        uint256 bal = address(this).balance;
        if(bal < _withdrawAmount){
            revert InsufficientBalance(bal,_withdrawAmount);
        }
    }
}



contract Account {
    uint256 public balance;


    function deposit(uint256 _amount) public {
        uint256 oldBalance = balance;
        uint256 newBalance = balance + _amount;

        require(newBalance >= oldBalance, "Overflow");

        balance = newBalance;

        assert(balance >= oldBalance);
    }

    function withdraw(uint256 _amount) public {
        uint256 oldBalance = balance;

  
        require(balance >= _amount, "Underflow");

        if (balance < _amount) {
            revert("Underflow");
        }

        balance -= _amount;

        assert(balance <= oldBalance);
    }
}