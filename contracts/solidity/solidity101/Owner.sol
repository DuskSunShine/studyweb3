// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;

contract Owner {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }

    // 定义modifier
    modifier onlyOwner() {
        require(msg.sender == owner); // 检查调用者是否为owner地址
        _; // 如果是的话，继续运行函数主体；否则报错并revert交易
    }

    // 定义一个带onlyOwner修饰符的函数
    function changeOwner(address _newOwner) external onlyOwner {
        owner = _newOwner; // 只有owner地址运行这个函数，并改变owner
    }
}
