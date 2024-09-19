// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;

// delegatecall和call类似，都是低级函数
// call: B call C, 上下文为 C (msg.sender = B, C中的状态变量受影响)
// delegatecall: B delegatecall C, 上下文为B (msg.sender = A, B中的状态变量受影响)
// 注意B和C的数据存储布局必须相同！变量类型、声明的前后顺序要相同，不然会搞砸合约。

// 被调用的合约C
contract C {
    uint256 public num;
    address public sender;

    function setVars(uint256 _num) public {
        num = _num;
        sender = msg.sender;
    }
}

//首先，合约B必须和目标合约C的变量名可以不同，变量类型、声明顺序必须相同
contract B {
    uint256 public num;
    address public sender;

    // 通过call来调用C的setVars()函数，将改变合约C里的状态变量
    //类似于反射调用???
    function callSetVars(address _addr, uint256 _num) external {
        // call setVars()
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        emit Response(success, data);
    }

    // 通过delegatecall来调用C的setVars()函数，将改变合约B里的状态变量
    //简单理解将C的函数copy到B调用，改变的是B的状态 C代理执行B的方法改变B的状态
    function delegatecallSetVars(address _addr, uint256 _num) external {
        // delegatecall setVars()
        (bool success, bytes memory data) = _addr.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        emit Response(success, data);
    }

    // 定义Response事件，输出call返回的结果success和data
    event Response(bool success, bytes data);
}
