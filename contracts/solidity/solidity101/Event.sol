// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;

contract Event {
    // 定义_balances映射变量，记录每个地址的持币数量
    mapping(address => uint256) public _balance;
    // 定义Transfer event，记录transfer交易的转账地址，接收地址和转账数量
    event Transfer(address indexed from, address indexed to, uint256 value);

    // 定义_transfer函数，执行转账逻辑
    function _transfer(
        address from,
        address to,
        uint256 value
    ) external {
        _balance[from] = 100 ether;
        // 检查from是否存在余额
        require(_balance[from] >= value, unicode"Insufficient balance余额不足");
        // 减少from余额
        _balance[from] -= value;
        // 增加to余额
        _balance[to] += value;
        // 触发Transfer事件
        emit Transfer(from, to, value);
    }
}
