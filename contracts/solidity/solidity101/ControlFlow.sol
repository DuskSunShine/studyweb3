// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;
import "@openzeppelin/contracts/access/Ownable.sol";

contract ControlFlow {
    function ifElseTest(uint256 _number) external pure returns (bool) {
        if (_number == 0) {
            return (true);
        } else {
            return (false);
        }
    }

    function forLoopTest() external pure returns (uint256) {
        uint256 sum = 1;
        for (uint256 i = 1; i <= 10; i++) {
            sum = sum + i;
        }
        return (sum);
    }

    function whileTest() public pure returns (uint256) {
        uint256 sum = 0;
        while (sum < 10) {
            sum++;
        }
        return (sum);
    }

    // 三元运算符 ternary/conditional operator
    function ternaryTest(uint256 x, uint256 y) public pure returns (uint256) {
        // return the max of x and y
        return x >= y ? x : y;
    }

    // 插入排序 [2,5,3,1] [2,3,5,1]
    function insertionSort(uint256[] memory a)
        public
        pure
        returns (uint256[] memory)
    {
        // note that uint can not take negative value
        for (uint256 i = 1; i < a.length; i++) {
            uint256 temp = a[i];
            uint256 j = i;
            while ((j >= 1) && (temp < a[j - 1])) {
                a[j] = a[j - 1];
                j--;
            }
            a[j] = temp;
        }
        return (a);
    }
}
