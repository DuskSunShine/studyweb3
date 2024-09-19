// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;

contract Receive {
    /* 触发fallback() 还是 receive()?
           接收ETH
              |
         msg.data有无？
            /  \
          无    有
          /      \
receive()存在?   fallback()
        / \
       是  否
      /     \
receive()  fallback   
    */
    //msg.data无且有receive函数
    // 定义事件
    event receivedCalled(address Sender, uint256 Value);
    event fallbackCalled(address Sender, uint256 Value, bytes Data);

    // 接收ETH时释放Received事件
    receive() external payable {
        emit receivedCalled(msg.sender, msg.value);
    }

    // fallback
    fallback() external payable {
        emit fallbackCalled(msg.sender, msg.value, msg.data);
    }
}

contract ReceiveETH {
    // 收到eth事件，记录amount和gas
    event Log(uint256 amount, uint256 gas);

    // receive方法，接收eth时被触发
    receive() external payable {
        emit Log(msg.value, gasleft());
    }

    function gettBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
