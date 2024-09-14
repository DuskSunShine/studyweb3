// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;
import "contracts/solidity/solidity101/extend/SuperParent.sol";

contract Parent is SuperParent {
    function talkSuper() external virtual override {
        emit Log("Parent");
    }

    function talk2Super() external virtual override {
        emit Log("Parent2");
    }

    function talkParent() external virtual {
        emit Log("Parent2");
    }

    //计算一个数分别被2除的值，但是传入的参数必须是2的倍数
    function getExactDividedBy2And3(uint256 _dividend)
        public
        pure
        extendModifier(_dividend)
        returns (uint256)
    {
        return getExactDividedBy2And3WithoutModifier(_dividend);
    }

    //计算一个数分别被2除的值
    function getExactDividedBy2And3WithoutModifier(uint256 _dividend)
        public
        pure
        returns (uint256)
    {
        uint256 div2 = _dividend / 2;
        return (div2);
    }
    //重写Modifier: 不重写时，输入9调用extendModifier，会revert，因为无法通过检查
    //删掉下面三行注释重写Modifier，这时候输入9调用extendModifier， 会调用成功
    // modifier extendModifier(uint _a) override {
    //     _;
    // }

    function justF() public  {

    }
}
