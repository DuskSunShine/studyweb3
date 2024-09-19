// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;

interface Icontract {
    function getBalance() external view returns (uint256);

    function setX(uint256 x) external payable;

    function getX() external view returns (uint256);
}

abstract contract AbsOtherContract {
    function absCallOtherGetX() external view virtual returns (uint256);
}

contract OtherContract is Icontract, AbsOtherContract {
    uint256 private _x = 0;
    // 收到eth的事件，记录amount和gas
    event Log(uint256 amount, uint256 gas);

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function absCallOtherGetX() external view override returns (uint256) {
        return _x;
    }

    function setX(uint256 x) external payable {
        _x = x;
        if (msg.value > 0) {
            emit Log(msg.value, gasleft());
        }
    }

    function getX() external view returns (uint256) {
        return _x;
    }

    function callSetX(address payable _addr, uint256 x) public payable {
        // call setX()，同时可以发送ETH data目标函数返回值
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("setX(uint256)", x)
        );
        if (success) {
            emit Response(success, data);
        }
    }

    // 定义Response事件，输出call返回的结果success和data
    event Response(bool success, bytes data);

    fallback() external payable {}

    receive() external payable {}

    function callNonExist(address _addr) external {
        // call 不存在的函数
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("foo(uint256)")
        );

        emit Response(success, data); //释放事件
    }
}
