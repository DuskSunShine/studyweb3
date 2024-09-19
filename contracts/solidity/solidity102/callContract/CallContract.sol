// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;
import "contracts/solidity/solidity102/callContract/OtherContract.sol";

contract CallContract {
    function callOtherSetX(address payable other, uint256 x) external {
        OtherContract(other).setX(x);
    }

    function interfaceCallOtherSetX(address other, uint256 x) external {
        Icontract(other).setX(x);
    }

    function callOtherGetX(OtherContract other)
        external
        view
        returns (uint256)
    {
        return other.getX();
    }

    function callGetX2(address payable other)
        external
        view
        returns (uint256 x)
    {
        OtherContract oc = OtherContract(other);
        x = oc.getX();
    }

    function setXTransferETH(address payable otherContract, uint256 x)
        external
        payable
    {
        OtherContract(otherContract).setX{value: x}(x);
    }

    function callSetX(address payable _addr, uint256 x)
        public
        payable
        returns (uint256)
    {
        // call setX()，同时可以发送ETH data目标函数返回值
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("setX(uint256)", x)
        );
        if (success) {
            // 解析返回值
            return abi.decode(data, (uint256));
        } else {
            return 0;
        }
    }

    function callGetX(address _addr) external returns (uint256) {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("getX()")
        );
        if (success) {
            // 解析返回值
            return abi.decode(data, (uint256));
        } else {
            return 0;
        }
    }

    receive() external payable {}

    fallback() external payable {}
}
