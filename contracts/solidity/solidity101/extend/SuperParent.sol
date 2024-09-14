// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;

contract SuperParent {
    event Log(string);

    function talkSuper() external virtual {
        emit Log("im your grandFather");
    }

    function talk2Super() external virtual {
        emit Log("im your grandFather2");
    }

    modifier extendModifier(uint256 _a) virtual {
        require(_a % 2 == 0);
        _;
    }
}
