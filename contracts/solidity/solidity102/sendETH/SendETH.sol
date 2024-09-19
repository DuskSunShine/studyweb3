// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;

/**

    三种方式向合约转账
*/
contract SendETH {
    // 构造函数，payable使得部署的时候可以转eth进去
    constructor() payable {}

    //// receive方法，接收eth时被触发
    receive() external payable {}

    error BalanceOOM(string msg);
    error SendError(string msg);
    //修饰器的使用，减少模板代码
    modifier checkBalance(uint256 value) {
        if (address(this).balance < value) revert BalanceOOM("balance oom");
        _;
    }

    // 用transfer()发送ETH
    function transferETH(address payable to, uint256 value)
        external
        payable
        checkBalance(value)
    {
        //if (address(this).balance < value) revert BalanceOOM("balance oom");
        to.transfer(value);
    }

    //send()发送ETH
    function sendETH(address payable to, uint256 value)
        external
        payable
        checkBalance(value)
    {
        //if (address(this).balance < value) revert BalanceOOM("balance oom");
        bool success = to.send(value);
        if (!success) revert SendError("send error");
    }

    //call()发送ETH
    function callETH(address payable to, uint256 value)
        external
        payable
        checkBalance(value)
    {
        // 处理下call的返回值，如果失败，revert交易并发送error
        (bool success, ) = to.call{value: value}("");
        if (!success) {
            revert SendError("call error");
        }
    }
}
