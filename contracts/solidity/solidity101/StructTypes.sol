// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;

contract StructTypes {
    //结构体（对象？，entity? data class?）
    struct Student {
        uint256 id;
        uint256 socpe;
    }
    //声明结构体
    Student public student;

    //  给结构体赋值
    // 方法1:在函数中创建一个storage的struct引用
    function initSudent1() external {
        Student storage _student = student;
        _student.id = 1;
        _student.socpe = 99;
    }

    //直接赋值
    function initStudent2() external {
        student.id = 2;
        student.socpe = 100;
    }

    //构造函数
    function initstudent3() external {
        student = Student(3, 101);
    }

    // 方法4:key value 类似js写法？
    function initStudent4() external {
        student = Student({id: 4, socpe: 60});
    }

    /***********************************************

        mapping

    **********************************************/
    //key只能是内置的值类型 引用类型不可用
    mapping(uint256 => address) public _addressById;
    mapping(string => address) public _addressByaddress;

    function writeMap(uint256 key, address value) external {
        value = address(this);
        _addressById[key] = value;
    }
}
