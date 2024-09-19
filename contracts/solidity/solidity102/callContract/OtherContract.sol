// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;

interface Icontract {
    function getBalance() external view returns (uint256);
    function setX(uint256 x)external payable;
    function getX()external view returns (uint256);
}

abstract contract AbsOtherContract{
    function absCallOtherGetX() virtual external view returns (uint256);
}


contract OtherContract is Icontract,AbsOtherContract {
    uint256 private _x = 0;
    // 收到eth的事件，记录amount和gas
    event Log(uint256 amount, uint256 gas);

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

     function absCallOtherGetX() override external view returns (uint256){
            return _x;
    }

    function setX(uint256 x)external payable {
        _x=x;
        if (msg.value>0){
            emit Log(msg.value,gasleft());
        }
    }

    function getX() external view returns (uint256){
        return _x;
    }
}
