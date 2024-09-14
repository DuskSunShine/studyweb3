// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;
import "contracts/solidity/solidity101/extend/SuperParent.sol";
import "contracts/solidity/solidity101/extend/Parent.sol";

contract Child is SuperParent, Parent {
    function talkSuper() external override(SuperParent, Parent) {
        emit Log("child");
    }

    function talk2Super() external override(SuperParent, Parent) {
        emit Log("child2");
        super.justF();
        Parent.justF();
    }

    //这里不重写调用就是parent中的方法
    // function talkParent() external override {

    // }
}
