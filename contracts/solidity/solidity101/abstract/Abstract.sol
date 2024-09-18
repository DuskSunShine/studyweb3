// SPDX-License-Identifier: MIT
pragma solidity >=0.8.22 <0.9.0;
abstract contract Abstract{
    function needImpl() public virtual returns (string memory);
}

