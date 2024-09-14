// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;

contract ArrayTypes {
    //定长数组
    uint256[8] array1;
    bytes1[5] array2;
    address[100] array3;
    //可变数组
    uint256[] array4;
    bytes1 public array5;
    address array6;
    bytes array7;

    // 初始化可变长度 Array
    uint256[] array8 = new uint256[](5);
    bytes array9 = new bytes(9);

    function intArray() external pure returns (uint256[] memory) {
        uint256[] memory x = new uint256[](3);
        x[0] = 1;
        x[1] = 3;
        x[2] = 4;
        return x;
    }

    function arrayPush() public returns (uint256[] memory) {
        uint256[2] memory a = [uint256(1), 2];
        array4 = a;
        array4.push(3);
        return array4;
    }

    /***********************************************************

            constant 常量  immutable不可变量=类似延迟初始化，但是初始化后不能改变 

    ************************************************************/

    // constant变量必须在声明的时候初始化，之后不能改变
    uint256 constant CONSTANT_NUM = 10;
    string constant CONSTANT_STRING = "0xAA";
    bytes constant CONSTANT_BYTES = "WTF";
    address constant CONSTANT_ADDRESS =0x0000000000000000000000000000000000000000;
}
