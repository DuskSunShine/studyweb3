// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;

contract HelloWeb3 {
    string public greeting = "Hello, Web3!";

    uint256 public  number = 5;
    uint256[2] public result=[1,2];

    /****************************************

        方法各关键字使用

    *****************************************/

    //external 只能被合约外部调用
    function add() external {
        number = number + 1;
    }


    //pure 关键字 不能读取和改变状态变量
    function addPure(uint256 _number)
        external
        pure
        returns (uint256 new_number_pure)
    {
        new_number_pure = _number + 1;
    }

    //view关键字 只能读取，不能改变状态变量
    function addView() external view returns (uint256 new_number_view) {
        return number + 1;
    }

    //internal关键字，只能内部调用或派生合约调用
    function minus() internal {
        //这里尝试异常处理
        if (number == 0) {
            revert("number is zero");
        }
        number = number - 1;
    }

    // 合约内的函数可以调用内部函数（minusCall这个函数只能外部调用）
    //同样external修饰的方法不能相互调用
    function minusCall() external {
        minus();
    }

    // payable: 递钱，能给合约支付eth的函数
    function minusPayable() external payable returns (uint256 balance) {
        minus();
        balance = address(this).balance;
    }

    /******************************************************
    
        函数的返回
    
    *******************************************************/

    // 返回多个变量，返回值不声明变量名
    function returnMultiple()
        public
        pure
        returns (
            uint256,
            bool,
            uint256[3] memory
        )
    {
        return (1, true, [uint256(1), 2, 5]);
    }

    // 命名式返回
    function returnNamed()
        public
        pure
        returns (
            uint256 _number,
            bool _bool,
            uint256[3] memory _array
        )
    {
        _number = 2;
        _bool = false;
        _array = [uint256(3), 2, 1];
    }

    // 读取返回值，解构式赋值
    function readReturn() public pure{
        // 读取全部返回值
        uint256 _number;
        bool _bool;
        bool _bool2;
        uint256[3] memory _array;
        (_number, _bool, _array) = returnNamed();
        
        // 读取部分返回值，解构式赋值
        (, _bool2, ) = returnNamed();
    }
    
    uint[] array4;
     function arrayPush() public returns(uint[] memory){
        uint[2] memory a = [uint(1),2];
        array4 = a;
        array4.push(3);
        return array4;
    }
}
